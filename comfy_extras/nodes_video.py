from __future__ import annotations

import os
import av
import torch
import folder_paths
import json
from typing import Optional
from typing_extensions import override
from fractions import Fraction
from comfy_api.input import AudioInput, ImageInput, VideoInput
from comfy_api.input_impl import VideoFromComponents, VideoFromFile
from comfy_api.util import VideoCodec, VideoComponents, VideoContainer
from comfy_api.latest import ComfyExtension, io, ui
from comfy.cli_args import args

class SaveWEBM(io.ComfyNode):
    @classmethod
    def define_schema(cls):
        return io.Schema(
            node_id="SaveWEBM",
            category="image/video",
            is_experimental=True,
            inputs=[
                io.Image.Input("images"),
                io.String.Input("filename_prefix", default="ComfyUI"),
                io.Combo.Input("codec", options=["vp9", "av1"]),
                io.Float.Input("fps", default=24.0, min=0.01, max=1000.0, step=0.01),
                io.Float.Input("crf", default=32.0, min=0, max=63.0, step=1, tooltip="Higher crf means lower quality with a smaller file size, lower crf means higher quality higher filesize."),
            ],
            outputs=[],
            hidden=[io.Hidden.prompt, io.Hidden.extra_pnginfo],
            is_output_node=True,
        )

    @classmethod
    def execute(cls, images, codec, fps, filename_prefix, crf) -> io.NodeOutput:
        full_output_folder, filename, counter, subfolder, filename_prefix = folder_paths.get_save_image_path(
            filename_prefix, folder_paths.get_output_directory(), images[0].shape[1], images[0].shape[0]
        )

        file = f"{filename}_{counter:05}_.webm"
        container = av.open(os.path.join(full_output_folder, file), mode="w")

        if cls.hidden.prompt is not None:
            container.metadata["prompt"] = json.dumps(cls.hidden.prompt)

        if cls.hidden.extra_pnginfo is not None:
            for x in cls.hidden.extra_pnginfo:
                container.metadata[x] = json.dumps(cls.hidden.extra_pnginfo[x])

        codec_map = {"vp9": "libvpx-vp9", "av1": "libsvtav1"}
        stream = container.add_stream(codec_map[codec], rate=Fraction(round(fps * 1000), 1000))
        stream.width = images.shape[-2]
        stream.height = images.shape[-3]
        stream.pix_fmt = "yuv420p10le" if codec == "av1" else "yuv420p"
        stream.bit_rate = 0
        stream.options = {'crf': str(crf)}
        if codec == "av1":
            stream.options["preset"] = "6"

        for frame in images:
            frame = av.VideoFrame.from_ndarray(torch.clamp(frame[..., :3] * 255, min=0, max=255).to(device=torch.device("cpu"), dtype=torch.uint8).numpy(), format="rgb24")
            for packet in stream.encode(frame):
                container.mux(packet)
        container.mux(stream.encode())
        container.close()

        return io.NodeOutput(ui=ui.PreviewVideo([ui.SavedResult(file, subfolder, io.FolderType.output)]))

class SaveVideo(io.ComfyNode):
    @classmethod
    def define_schema(cls):
        return io.Schema(
            node_id="SaveVideo",
            display_name="Save Video",
            category="image/video",
            description="Saves the input images to your ComfyUI output directory.",
            inputs=[
                io.Video.Input("video", tooltip="The video to save."),
                io.String.Input("filename_prefix", default="video/ComfyUI", tooltip="The prefix for the file to save. This may include formatting information such as %date:yyyy-MM-dd% or %Empty Latent Image.width% to include values from nodes."),
                io.Combo.Input("format", options=VideoContainer.as_input(), default="auto", tooltip="The format to save the video as."),
                io.Combo.Input("codec", options=VideoCodec.as_input(), default="auto", tooltip="The codec to use for the video."),
            ],
            outputs=[],
            hidden=[io.Hidden.prompt, io.Hidden.extra_pnginfo],
            is_output_node=True,
        )

    @classmethod
    def execute(cls, video: VideoInput, filename_prefix, format, codec) -> io.NodeOutput:
        width, height = video.get_dimensions()
        full_output_folder, filename, counter, subfolder, filename_prefix = folder_paths.get_save_image_path(
            filename_prefix,
            folder_paths.get_output_directory(),
            width,
            height
        )
        saved_metadata = None
        if not args.disable_metadata:
            metadata = {}
            if cls.hidden.extra_pnginfo is not None:
                metadata.update(cls.hidden.extra_pnginfo)
            if cls.hidden.prompt is not None:
                metadata["prompt"] = cls.hidden.prompt
            if len(metadata) > 0:
                saved_metadata = metadata
        file = f"{filename}_{counter:05}_.{VideoContainer.get_extension(format)}"
        video.save_to(
            os.path.join(full_output_folder, file),
            format=format,
            codec=codec,
            metadata=saved_metadata
        )

        return io.NodeOutput(ui=ui.PreviewVideo([ui.SavedResult(file, subfolder, io.FolderType.output)]))




# --- Add these imports for encryption ---
from cryptography.fernet import Fernet
# --- End of new imports ---

# --- Define your encryption key securely (example only, see notes below) ---
# In a real application, do NOT hardcode the key. Store it securely (e.g., environment variable, secure config file).
# Example of generating a key: print(Fernet.generate_key())
ENCRYPTION_KEY = b'0cZ56f7w3ejcPODA6yC1E2iKi3gOog8ROrT-bRfesG8=' # Replace with your actual key
# --- End of key definition ---

class SaveVideoEncrypted(io.ComfyNode):
    @classmethod
    def define_schema(cls):
        return io.Schema(
            node_id="SaveVideoEncrypted",
            display_name="Save Video (Encrypted)",
            category="image/video",
            description="Saves the input images to your ComfyUI output directory with encryption.",
            inputs=[
                io.Video.Input("video", tooltip="The video to save."),
                io.String.Input("filename_prefix", default="video/ComfyUI_encrypted", tooltip="The prefix for the file to save. This may include formatting information such as %date:yyyy-MM-dd% or %Empty Latent Image.width% to include values from nodes."),
                io.Combo.Input("format", options=VideoContainer.as_input(), default="auto", tooltip="The format to save the video as."),
                io.Combo.Input("codec", options=VideoCodec.as_input(), default="auto", tooltip="The codec to use for the video."),
            ],
            outputs=[],
            hidden=[io.Hidden.prompt, io.Hidden.extra_pnginfo],
            is_output_node=True,
        )

    @classmethod
    def execute(cls, video: VideoInput, filename_prefix, format, codec) -> io.NodeOutput:
        width, height = video.get_dimensions()
        full_output_folder, filename, counter, subfolder, filename_prefix = folder_paths.get_save_image_path(
            filename_prefix,
            folder_paths.get_output_directory(),
            width,
            height
        )

        # Generate the final encrypted file path with .enc extension
        file_extension = VideoContainer.get_extension(format)
        encrypted_file_path = os.path.join(full_output_folder, f"{filename}_{counter:05}_.{file_extension}.enc")

        saved_metadata = None
        if not args.disable_metadata:
            metadata = {}
            if cls.hidden.extra_pnginfo is not None:
                metadata.update(cls.hidden.extra_pnginfo)
            if cls.hidden.prompt is not None:
                metadata["prompt"] = cls.hidden.prompt
            if len(metadata) > 0:
                saved_metadata = metadata

        # --- Encryption Logic: Save to memory first ---
        try:
            # Create an in-memory buffer to hold the video data
            video_buffer = io.BytesIO()

            # Save the video data directly into the buffer
            video.save_to(video_buffer, format=format, codec=codec, metadata=saved_metadata)

            # Get the video data as bytes from the buffer
            video_data = video_buffer.getvalue()

            # Close the buffer
            video_buffer.close()

        except Exception as e:
            print(f"Error saving video to memory: {e}")
            # Handle the error appropriately (e.g., return an error node output)
            return io.NodeOutput(ui=ui.PreviewVideo([]))

        # Initialize the Fernet cipher
        fernet = Fernet(ENCRYPTION_KEY)

        # Encrypt the video data bytes
        encrypted_data = fernet.encrypt(video_data)

        # Write the encrypted data directly to the final file location
        try:
            with open(encrypted_file_path, 'wb') as f:
                f.write(encrypted_data)
        except IOError as e:
            print(f"Error writing encrypted video file: {e}")
            # Handle the error appropriately
            return io.NodeOutput(ui=ui.PreviewVideo([]))

        # Return the path to the encrypted file for UI reference
        return io.NodeOutput(ui=ui.PreviewVideo([ui.SavedResult(os.path.basename(encrypted_file_path), subfolder, io.FolderType.output)]))


class CreateVideo(io.ComfyNode):
    @classmethod
    def define_schema(cls):
        return io.Schema(
            node_id="CreateVideo",
            display_name="Create Video",
            category="image/video",
            description="Create a video from images.",
            inputs=[
                io.Image.Input("images", tooltip="The images to create a video from."),
                io.Float.Input("fps", default=30.0, min=1.0, max=120.0, step=1.0),
                io.Audio.Input("audio", optional=True, tooltip="The audio to add to the video."),
            ],
            outputs=[
                io.Video.Output(),
            ],
        )

    @classmethod
    def execute(cls, images: ImageInput, fps: float, audio: Optional[AudioInput] = None) -> io.NodeOutput:
        return io.NodeOutput(
            VideoFromComponents(VideoComponents(images=images, audio=audio, frame_rate=Fraction(fps)))
        )

class GetVideoComponents(io.ComfyNode):
    @classmethod
    def define_schema(cls):
        return io.Schema(
            node_id="GetVideoComponents",
            display_name="Get Video Components",
            category="image/video",
            description="Extracts all components from a video: frames, audio, and framerate.",
            inputs=[
                io.Video.Input("video", tooltip="The video to extract components from."),
            ],
            outputs=[
                io.Image.Output(display_name="images"),
                io.Audio.Output(display_name="audio"),
                io.Float.Output(display_name="fps"),
            ],
        )

    @classmethod
    def execute(cls, video: VideoInput) -> io.NodeOutput:
        components = video.get_components()

        return io.NodeOutput(components.images, components.audio, float(components.frame_rate))

class LoadVideo(io.ComfyNode):
    @classmethod
    def define_schema(cls):
        input_dir = folder_paths.get_input_directory()
        files = [f for f in os.listdir(input_dir) if os.path.isfile(os.path.join(input_dir, f))]
        files = folder_paths.filter_files_content_types(files, ["video"])
        return io.Schema(
            node_id="LoadVideo",
            display_name="Load Video",
            category="image/video",
            inputs=[
                io.Combo.Input("file", options=sorted(files), upload=io.UploadType.video),
            ],
            outputs=[
                io.Video.Output(),
            ],
        )

    @classmethod
    def execute(cls, file) -> io.NodeOutput:
        video_path = folder_paths.get_annotated_filepath(file)
        return io.NodeOutput(VideoFromFile(video_path))

    @classmethod
    def fingerprint_inputs(s, file):
        video_path = folder_paths.get_annotated_filepath(file)
        mod_time = os.path.getmtime(video_path)
        # Instead of hashing the file, we can just use the modification time to avoid
        # rehashing large files.
        return mod_time

    @classmethod
    def validate_inputs(s, file):
        if not folder_paths.exists_annotated_filepath(file):
            return "Invalid video file: {}".format(file)

        return True


class VideoExtension(ComfyExtension):
    @override
    async def get_node_list(self) -> list[type[io.ComfyNode]]:
        return [
            SaveWEBM,
            SaveVideo,
            SaveVideoEncrypted,
            CreateVideo,
            GetVideoComponents,
            LoadVideo,
        ]

async def comfy_entrypoint() -> VideoExtension:
    return VideoExtension()
