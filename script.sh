#    -----  链接模型  ------------

# cosmos ？
ln -s /kaggle/input/cosmos-predict2-2b-video2world-480p-16fps/cosmos_predict2_2B_video2world_480p_16fps.safetensors ./models/diffusion_models/cosmos_predict2_2B_video2world_480p_16fps.safetensors

# my lora
# git clone https://huggingface.co/datasets/Heng365/loras /kaggle/working/fromhf
# mv /kaggle/working/fromhf/* ./models/loras

# sd lora ？
ln -s /kaggle/input/moxinv1/MoXinV1.safetensors ./models/loras/MoXinV1.safetensors
ln -s /kaggle/input/blindbox-v1-mix/blindbox_v1_mix.safetensors ./models/loras/blindbox_v1_mix.safetensors
ln -s /kaggle/input/dreamshaper-8/dreamshaper_8.safetensors ./models/checkpoints/dreamshaper_8.safetensors

ln -s /kaggle/input/control-v11p-sd15-openpose/control_v11p_sd15_openpose.pth ./models/controlnet/control_v11p_sd15_openpose.pth

#wan t2v
ln -s /kaggle/input/wan-2-1-vae/wan_2.1_vae.safetensors ./models/vae/wan_2.1_vae.safetensors
ln -s /kaggle/input/umt5-xxl-fp8-e4m3fn-scaled/umt5_xxl_fp8_e4m3fn_scaled.safetensors ./models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors
# ln -s /kaggle/input/wan2-1-t2v-1-3b-fp16/wan2.1_t2v_1.3B_fp16.safetensors ./models/diffusion_models/wan2.1_t2v_1.3B_fp16.safetensors

# wan vace
#wan2.1_vace_1.3B_fp16.safetensors, 目前仅支持480P的视频，不能支持720P的。
# ln -s /kaggle/input/wan2-1-vace-1-3b-fp16/wan2.1_vace_1.3B_fp16.safetensors ./models/diffusion_models/wan2.1_vace_1.3B_fp16.safetensors
# ln -s /kaggle/input/wan21-causvid-bidirect2-t2v-1-3b-lora-rank32/Wan21_CausVid_bidirect2_T2V_1_3B_lora_rank32.safetensors ./models/loras/Wan21_CausVid_bidirect2_T2V_1_3B_lora_rank32.safetensors
ln -s /kaggle/input/umt5-xxl-fp16/umt5_xxl_fp16.safetensors ./models/text_encoders/umt5_xxl_fp16.safetensors
#wan2.1_vace_14B_fp16.safetensors, T4 16G 爆了
# wget -c https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_vace_14B_fp16.safetensors -P ./models/diffusion_models
# ln -s /kaggle/input/wan21-causvid-14b-t2v-lora-rank32/Wan21_CausVid_14B_T2V_lora_rank32.safetensors ./models/loras/Wan21_CausVid_14B_T2V_lora_rank32.safetensors

# wan lora: dabaichui 试一试哦！！
wget -c https://huggingface.co/Heng365/dabaichui/resolve/main/dabaichui.safetensors -P ./models/loras

wget -c https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl.vae.safetensors -P ./models/vae

# wget -c https://huggingface.co/thibaud/controlnet-openpose-sdxl-1.0/resolve/d973c1cc9d205a69cb3650663e827acc4863a640/OpenPoseXL2.safetensors -P ./models/controlnet

#Flux kontext
ln -s /kaggle/input/flux-ae/flux-ae.safetensors ./models/vae/ae.safetensors
ln -s /kaggle/input/clip-l/clip_l.safetensors ./models/text_encoders/clip_l.safetensors
ln -s /kaggle/input/t5xxl-fp8-e4m3fn-scaled/t5xxl_fp8_e4m3fn_scaled.safetensors ./models/text_encoders/t5xxl_fp8_e4m3fn_scaled.safetensors
ln -s /kaggle/input/t5xxl-fp8-e4m3fn/t5xxl_fp8_e4m3fn.safetensors ./models/text_encoders/t5xxl_fp8_e4m3fn.safetensors
ln -s /kaggle/input/flux1-dev-kontext-fp8-scaled/flux1-dev-kontext_fp8_scaled.safetensors ./models/diffusion_models/flux1-dev-kontext_fp8_scaled.safetensors

ln -s /kaggle/input/flux1-fill-dev/flux1-fill-dev.safetensors ./models/diffusion_models/flux1-fill-dev.safetensors

# wget https://huggingface.co/zer0int/CLIP-GmP-ViT-L-14/resolve/main/ViT-L-14-TEXT-detail-improved-hiT-GmP-TE-only-HF.safetensors -P ./models/text_encoders
# wget https://huggingface.co/Madespace/clip/resolve/main/google_t5-v1_1-xxl_encoderonly-fp8_e4m3fn.safetensors -P ./models/text_encoders


# Qwen Image
ln -s /kaggle/input/qwen-image-edit-fp8-e4m3fn/qwen_image_edit_fp8_e4m3fn.safetensors ./models/diffusion_models/qwen_image_edit_fp8_e4m3fn.safetensors
ln -s /kaggle/input/qwen-image-vae/qwen_image_vae.safetensors ./models/vae/qwen_image_vae.safetensors
ln -s /kaggle/input/qwen-2-5-vl-7b-fp8-scaled/qwen_2.5_vl_7b_fp8_scaled.safetensors ./models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors

ln -s /kaggle/input/qwen-image-fp8-e4m3fn/qwen_image_fp8_e4m3fn.safetensors ./models/diffusion_models/qwen_image_fp8_e4m3fn.safetensors

ln -s /kaggle/input/qwen-image-lightning-8steps-v2-0/Qwen-Image-Lightning-8steps-V2.0.safetensors ./models/loras/Qwen-Image-Lightning-8steps-V2.0.safetensors
ln -s /kaggle/input/qwen-image-lightning-4steps-v2-0/Qwen-Image-Lightning-4steps-V2.0.safetensors ./models/loras/Qwen-Image-Lightning-4steps-V2.0.safetensors

ln -s /kaggle/input/qwen-image-edit-lightning-4steps-v1-0/Qwen-Image-Edit-Lightning-4steps-V1.0.safetensors ./models/loras/Qwen-Image-Edit-Lightning-4steps-V1.0.safetensors
ln -s /kaggle/input/qwen-image-edit-lightning-8steps-v1-0/Qwen-Image-Edit-Lightning-8steps-V1.0.safetensors ./models/loras/Qwen-Image-Edit-Lightning-8steps-V1.0.safetensors

#Flux dev
ln -s /kaggle/input/flux1-dev-fp8/flux1-dev-fp8.safetensors ./models/diffusion_models/flux1-dev-fp8.safetensors
ln -s /kaggle/input/flux1-dev-fp8/flux1-dev-fp8.safetensors ./models/checkpoints/flux1-dev-fp8.safetensors


ln -s /kaggle/input/sigclip-vision-patch14-384/sigclip_vision_patch14_384.safetensors ./models/clip_vision/sigclip_vision_patch14_384.safetensors

# https://huggingface.co/black-forest-labs/FLUX.1-Redux-dev/blob/main/flux1-redux-dev.safetensors
mkdir -p ./models/style_models
ln -s /kaggle/input/flux1-redux-dev/flux1-redux-dev.safetensors ./models/style_models/flux1-redux-dev.safetensors


# kontext turnaround sheet lora: It won't work well on real human photos
# wget -c https://huggingface.co/reverentelusarca/kontext-turnaround-sheet-lora-v1/resolve/main/kontext-turnaround-sheet-v1.safetensors -P ./models/loras


#iniverseMixSFWNSFW_ponyRealGuofengV51  dreamshaperXL_lightningDPMSDE
ln -s /kaggle/input/juggernaut-xl-ragnarok/Juggernaut-XL-Ragnarok.safetensors ./models/checkpoints
ln -s /kaggle/input/iniversemix/iniverseMix.safetensors ./models/checkpoints/iniverseMix.safetensors

ln -s /kaggle/input/chilloutmix/chilloutmix_NiPrunedFp32Fix.safetensors ./models/checkpoints/chilloutmix_NiPrunedFp32Fix.safetensors
wget https://huggingface.co/yesyeahvh/ulzzang-6500/resolve/main/ulzzang-6500.pt -O ./models/embeddings/ulzzang-6500.pt
wget https://huggingface.co/KatarLegacy/PureErosFace/resolve/main/pureerosface_v1.pt -O ./models/embeddings/pureerosface_v1.pt

#InstantID
mkdir -p ./models/instantid
# wget -c https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin -P ./models/instantid
ln -s /kaggle/input/ip-adapter/ip-adapter.bin ./models/instantid/ip-adapter.bin

# wget -c https://huggingface.co/MonsterMMORPG/tools/resolve/main/antelopev2.zip -P ./models
# mkdir -p ./models/insightface/models
# unzip ./models/antelopev2.zip -d ./models/insightface/models

# instantid
#  -O overrides -P if both are specified.
# wget -c https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/diffusion_pytorch_model.safetensors -O ./models/controlnet/instantid-controlnet.safetensors
ln -s /kaggle/input/diffusion-pytorch-model/diffusion_pytorch_model.safetensors ./models/controlnet/instantid-controlnet.safetensors
# wget -c https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/config.json -P ./models/controlnet

# wget -c https://huggingface.co/lllyasviel/sd_control_collection/resolve/d1b278d0d1103a3a7c4f7c2c327d236b082a75b1/thibaud_xl_openpose.safetensors -P ./models/controlnet

# When using ultralytics models, save them separately in models/ultralytics/bbox and models/ultralytics/segm depending on the type of model.
# mkdir -p ./models/ultralytics/bbox
# wget -c https://huggingface.co/Tenofas/ComfyUI/resolve/d79945fb5c16e8aef8a1eb3ba1788d72152c6d96/ultralytics/bbox/Eyes.pt -P ./models/ultralytics/bbox

# wget -c https://huggingface.co/YouLiXiya/YL-SAM/resolve/main/sam_vit_b_01ec64.pth -P  ./models/sams
# wget -c https://huggingface.co/datasets/Gourieff/ReActor/resolve/main/models/detection/bbox/face_yolov8m.pt -P ./models/ultralytics/bbox



# # ComfyUI_IPAdapter_plus models
# mkdir -p ./models/ipadapter
# wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors -O ./models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
# # SDXL ipadapter model
# wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors -P ./models/ipadapter
# wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors -P ./models/ipadapter
# wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors -P ./models/ipadapter






# 质量还不错，速度有点慢
# wget -c https://huggingface.co/city96/t5-v1_1-xxl-encoder-gguf/resolve/main/t5-v1_1-xxl-encoder-Q8_0.gguf -P ./models/text_encoders
# wget -c https://huggingface.co/city96/FLUX.1-dev-gguf/resolve/main/flux1-dev-Q8_0.gguf -P ./models/diffusion_models

# ComfyUI-Kolors-MZ faceid做什么用的?
# wget -c https://huggingface.co/Kwai-Kolors/Kolors-IP-Adapter-Plus/resolve/main/ip_adapter_plus_general.bin -P ./models/ipadapter
# wget -c https://huggingface.co/Kwai-Kolors/Kolors-IP-Adapter-Plus/resolve/main/image_encoder/pytorch_model.bin -P ./models/clip_vision


# wan2.1 i2v
# wget -c https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_i2v_480p_14B_fp8_scaled.safetensors -P ./models/diffusion_models
# wget -c https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/unet/WAN/Wan2.1-VACE-14B-Q5_K_S.gguf -P ./models/diffusion_models

# wget -c https://huggingface.co/UmeAiRT/ComfyUI-Auto_installer/resolve/main/models/unet/WAN/Wan2.1-VACE-14B-Q4_K_S.gguf -P ./models/diffusion_models

# wan / qwen image 模型 社区版本

# ln -s /kaggle/input/wan2-1-i2v-14b-480p-q4-k-m/wan2.1-i2v-14b-480p-Q4_K_M.gguf ./models/diffusion_models/wan2.1-i2v-14b-480p-Q4_K_M.gguf
# ln -s /kaggle/input/wan2-1-i2v-14b-480p-fp8-e5m2/Wan2_1-I2V-14B-480P_fp8_e5m2.safetensors ./models/diffusion_models/Wan2_1-I2V-14B-480P_fp8_e5m2.safetensors
# ln -s /kaggle/input/wan2-1-vae-bf16/Wan2_1_VAE_bf16.safetensors ./models/vae/Wan2_1_VAE_bf16.safetensors
# ln -s /kaggle/input/umt5-xxl-enc-fp8-e4m3fn/umt5-xxl-enc-fp8_e4m3fn.safetensors ./models/clip/umt5-xxl-enc-fp8_e4m3fn.safetensors
# ln -s /kaggle/input/open-clip-xlm-roberta-large-14-fp16/open-clip-xlm-roberta-large-14_fp16.safetensors ./models/clip/open-clip-xlm-roberta-large-14_fp16.safetensors

# ln -s /kaggle/input/qwen-image-q4-k-s/qwen-image-Q4_K_S.gguf ./models/diffusion_models/qwen-image-Q4_K_S.gguf
# ln -s /kaggle/input/qwen-image-edit-q4-k-s/Qwen_Image_Edit-Q4_K_S.gguf ./models/diffusion_models/Qwen_Image_Edit-Q4_K_S.gguf
# ln -s /kaggle/input/qwen2-5-vl-7b-instruct-mmproj-bf16/Qwen2.5-VL-7B-Instruct-mmproj-BF16.gguf ./models/text_encoders/Qwen2.5-VL-7B-Instruct-mmproj-BF16.gguf

ln -s /kaggle/input/qwen-image-q6-k/qwen-image-Q6_K.gguf ./models/diffusion_models/qwen-image-Q6_K.gguf

ln -s /kaggle/input/qwen-image-edit-2509-q6-k/Qwen-Image-Edit-2509-Q6_K.gguf ./models/diffusion_models/Qwen_Image_Edit-2509-Q6_K.gguf
ln -s /kaggle/input/qwen-image-edit-q6-k/Qwen_Image_Edit-Q6_K.gguf ./models/diffusion_models/Qwen_Image_Edit-Q6_K.gguf

ln -s /kaggle/input/qwen-image-asianmix-lora/Qwen_Image_AsianMix_Lora.safetensors ./models/loras/Qwen_Image_AsianMix_Lora.safetensors

# ln -s /kaggle/input/svdq-int4-r128-qwen-image/svdq-int4_r128-qwen-image.safetensors ./models/diffusion_models/svdq-int4_r128-qwen-image.safetensors
# ln -s /kaggle/input/svdq-int4-r128-qwen-image-lightningv1-0-4steps/svdq-int4_r128-qwen-image-lightningv1.0-4steps.safetensors ./models/loras

ln -s /kaggle/input/wan2-2-t2v-a14b-highnoise-q4-k-s/Wan2.2-T2V-A14B-HighNoise-Q4_K_S.gguf ./models/diffusion_models/Wan2.2-T2V-A14B-HighNoise-Q4_K_S.gguf
ln -s /kaggle/input/wan2-2-t2v-a14b-lownoise-q4-0/Wan2.2-T2V-A14B-LowNoise-Q4_0.gguf ./models/diffusion_models/Wan2.2-T2V-A14B-LowNoise-Q4_0.gguf
ln -s /kaggle/input/wan2-2-i2v-a14b-4steps-lora-high-noise-model/Wan2.2-I2V-A14B-4steps-lora-high_noise_model.safetensors ./models/loras/Wan2.2-I2V-A14B-4steps-lora-high_noise_model.safetensors
ln -s /kaggle/input/wan2-2-i2v-a14b-4steps-lora-low-noise-model/Wan2.2-I2V-A14B-4steps-lora-low_noise_model.safetensors ./models/loras/Wan2.2-I2V-A14B-4steps-lora-low_noise_model.safetensors

ln -s /kaggle/input/wan2-2-i2v-a14b-highnoise-q4-k-s/Wan2.2-I2V-A14B-HighNoise-Q4_K_S.gguf ./models/diffusion_models/Wan2.2-I2V-A14B-HighNoise-Q4_K_S.gguf
ln -s /kaggle/input/wan2-2-i2v-a14b-lownoise-q4-0/Wan2.2-I2V-A14B-LowNoise-Q4_0.gguf ./models/diffusion_models/Wan2.2-I2V-A14B-LowNoise-Q4_0.gguf

ln -s /kaggle/input/wan2-2-i2v-lightx2v-4steps-lora-v1-high-noise/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors ./models/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors
ln -s /kaggle/input/wan2-2-i2v-lightx2v-4steps-lora-v1-low-noise/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors ./models/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors

ln -s /kaggle/input/wan2-2-fun-a14b-control-highnoise-q4-k-s/Wan2.2-Fun-A14B-Control_HighNoise-Q4_K_S.gguf ./models/diffusion_models/Wan2.2-Fun-A14B-Control_HighNoise-Q4_K_S.gguf
ln -s /kaggle/input/wan2-2-fun-a14b-control-lownoise-q4-0/Wan2.2-Fun-A14B-Control_LowNoise-Q4_0.gguf ./models/diffusion_models/Wan2.2-Fun-A14B-Control_LowNoise-Q4_0.gguf

    
ln -s /kaggle/input/umt5-xxl-encoder-q5-k-m/umt5-xxl-encoder-Q5_K_M.gguf ./models/text_encoders/umt5-xxl-encoder-Q5_K_M.gguf

ln -s /kaggle/input/wan2-2-s2v-14b-q4-0/Wan2.2-S2V-14B-Q4_0.gguf ./models/diffusion_models/Wan2.2-S2V-14B-Q4_0.gguf
ln -s /kaggle/input/wan2-2-t2v-lightx2v-4steps-lora-v1-1-high-noise/wan2.2_t2v_lightx2v_4steps_lora_v1.1_high_noise.safetensors ./models/loras/wan2.2_t2v_lightx2v_4steps_lora_v1.1_high_noise.safetensors
ln -s /kaggle/input/wav2vec2-large-english-fp16/wav2vec2_large_english_fp16.safetensors ./models/audio_encoders/wav2vec2_large_english_fp16.safetensors
ln -s /kaggle/input/wav2vec2-large-chinese-zh-cn/wav2vec2-large-chinese-zh-cn.safetensors ./models/audio_encoders/wav2vec2-large-chinese-zh-cn.safetensors

wget -c https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank32_bf16.safetensors -P ./models/loras

# 放大
# wget -c https://huggingface.co/schwgHao/RealESRGAN_x4plus/resolve/main/RealESRGAN_x4plus.pth -P ./models/upscale_models
# wget -c https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth -P ./models/upscale_models
# wget -c https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/8x_NMKD-Superscale_150000_G.pth -P ./models/upscale_models
# wget -c https://huggingface.co/Phips/4xNomos8kDAT/resolve/main/4xNomos8kDAT.safetensors -P ./models/upscale_models
# wget -c https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth -P ./models/upscale_models
# wget -c https://huggingface.co/gemasai/4x_NMKD-Siax_200k/resolve/main/4x_NMKD-Siax_200k.pth -P ./models/upscale_models

ln -s /kaggle/input/clip-vision-h/clip_vision_h.safetensors ./models/clip_vision/clip_vision_h.safetensors
ln -s /kaggle/input/clip-vit-large-patch14/clip-vit-large-patch14.safetensors ./models/clip_vision/clip-vit-large-patch14.safetensors

# mkdir -p ./models/xlabs/ipadapters
# ln -s /kaggle/input/flux-ip-adapter-v2/flux-ip-adapter-v2.safetensors ./models/xlabs/ipadapters/flux-ip-adapter-v2.safetensors

# wget -c https://huggingface.co/thedeoxen/refcontrol-flux-kontext-reference-pose-lora/resolve/main/refcontrol_pose.safetensors -P ./models/loras



# Flux ControlNet
# wget -c https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Union-Pro-2.0/resolve/main/diffusion_pytorch_model.safetensors -O ./models/controlnet/flux.1-dev-controlnet-union-pro-2.0.safetensors
# Flux ControlNet fp8
# wget -c https://huggingface.co/ABDALLALSWAITI/FLUX.1-dev-ControlNet-Union-Pro-2.0-fp8/resolve/main/diffusion_pytorch_model.safetensors -O ./models/controlnet/flux.1-dev-controlnet-union-pro-2.0-fp8.safetensors


# Qwen ControlNet
wget -c https://huggingface.co/Comfy-Org/Qwen-Image-DiffSynth-ControlNets/resolve/main/split_files/loras/qwen_image_union_diffsynth_lora.safetensors -P ./models/loras



# ----------------   安装自定义插件节点  ----------------

# 1 ComfyUI-Manager
cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
cd /kaggle/ComfyUI

# nunchaku_nodes
# cd custom_nodes
# git clone https://github.com/mit-han-lab/ComfyUI-nunchaku nunchaku_nodes
# cd /kaggle/ComfyUI

# 安装 nunchaku : 更新了！！！ 
# pip install https://github.com/nunchaku-tech/nunchaku/releases/download/v1.0.0/nunchaku-1.0.0+torch2.6-cp311-cp311-linux_x86_64.whl

# wget -c https://huggingface.co/mit-han-lab/nunchaku-flux.1-kontext-dev/resolve/main/svdq-int4_r32-flux.1-kontext-dev.safetensors -P ./models/diffusion_models
ln -s /kaggle/input/svdq-int4-r32-flux-1-kontext-dev/svdq-int4_r32-flux.1-kontext-dev.safetensors ./models/diffusion_models/svdq-int4_r32-flux.1-kontext-dev.safetensors

# 对于kaggle T4 来说，fp8版本占有内存有点高，有的时候直接崩掉
# ln -s /kaggle/input/qwen-image-edit-2509-fp8-e4m3fn/qwen_image_edit_2509_fp8_e4m3fn.safetensors ./models/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors



# 3 ComfyUI-GGUF
cd custom_nodes
git clone https://github.com/city96/ComfyUI-GGUF
cd ComfyUI-GGUF
pip install --upgrade gguf
cd /kaggle/ComfyUI

# 4 encrypt image
cd custom_nodes
git clone https://github.com/Vander-Bilt/comfyui-encrypt-image.git
cd /kaggle/ComfyUI

#5 Prompts Generator
# cd custom_nodes
# git clone https://github.com/fairy-root/Flux-Prompt-Generator.git
# cd /kaggle/ComfyUI


# 6 Custom-Scripts
cd custom_nodes
git clone https://github.com/Vander-Bilt/ComfyUI-Custom-Scripts.git
cd /kaggle/ComfyUI

# 7 save2hf
cd custom_nodes
git clone https://github.com/Vander-Bilt/save2hf.git
cd save2hf
pip install -r requirements.txt -q
cd /kaggle/ComfyUI


cd custom_nodes
git clone https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait.git
cd ComfyUI-AdvancedLivePortrait
pip install -r requirements.txt
cd /kaggle/ComfyUI

cd custom_nodes
# git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git
git clone https://github.com/Vander-Bilt/ComfyUI-VideoHelperSuite.git
cd ComfyUI-VideoHelperSuite
pip install -r requirements.txt
cd /kaggle/ComfyUI

cd custom_nodes
git clone https://github.com/SeanScripts/ComfyUI-Unload-Model.git
cd /kaggle/ComfyUI

cd custom_nodes
git clone https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git
cd ComfyUI-Frame-Interpolation
python install.py
cd /kaggle/ComfyUI

# cd custom_nodes
# git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git
# cd ComfyUI-Inspire-Pack
# pip install -r requirements.txt -q
# cd /kaggle/ComfyUI

cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack comfyui-impact-pack
cd comfyui-impact-pack
pip install -r requirements.txt -q
cd /kaggle/ComfyUI


# cd custom_nodes
# git clone https://github.com/ltdrdata/ComfyUI-Impact-Subpack
# cd ComfyUI-Impact-Subpack
# pip install -r requirements.txt -q
# cd /kaggle/ComfyUI



# Goto test no pip install ...

# cd custom_nodes
# git clone https://github.com/cubiq/ComfyUI_essentials.git
# cd ComfyUI_essentials
# pip install -r requirements.txt -q
# cd /kaggle/ComfyUI

# 监控VRAM等
# cd custom_nodes
# git clone https://github.com/crystian/comfyui-crystools.git
# cd comfyui-crystools
# pip install -r requirements.txt -q
# cd /kaggle/ComfyUI



cd custom_nodes
git clone https://github.com/yolain/ComfyUI-Easy-Use
cd ComfyUI-Easy-Use
pip install -r requirements.txt -q
cd /kaggle/ComfyUI

# cd custom_nodes
# git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git
# cd /kaggle/ComfyUI


# cd custom_nodes
# git clone https://github.com/cubiq/PuLID_ComfyUI.git
# cd PuLID_ComfyUI
# pip install -r requirements.txt -q
# cd /kaggle/ComfyUI



# cd custom_nodes
# git clone https://github.com/balazik/ComfyUI-PuLID-Flux.git
# cd ComfyUI-PuLID-Flux
# pip install -r requirements.txt -q
# cd /kaggle/ComfyUI

# cd custom_nodes
# git clone https://github.com/Vander-Bilt/ComfyUI-PuLID-Flux-Enhanced.git
# cd ComfyUI-PuLID-Flux-Enhanced
# pip install -r requirements.txt -q
# cd /kaggle/ComfyUI

# ** Since ComfyUI Core doesn’t come with the corresponding OpenPose image preprocessor, 
# ** you need to download the preprocessor plugin first
# ComfyUI's ControlNet Auxiliary Preprocessors
cd custom_nodes
git clone https://github.com/Fannovel16/comfyui_controlnet_aux/
cd comfyui_controlnet_aux
pip install -r requirements.txt -q
cd /kaggle/ComfyUI



# cd custom_nodes
# git clone https://github.com/chrisgoringe/cg-use-everywhere.git
# cd /kaggle/ComfyUI

# cd custom_nodes
# git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git
# cd /kaggle/ComfyUI

cd custom_nodes
git clone https://github.com/ltdrdata/was-node-suite-comfyui.git
cd was-node-suite-comfyui
pip install -r requirements.txt -q
cd /kaggle/ComfyUI

# cd custom_nodes
# git clone https://github.com/tusharbhutt/Endless-Nodes.git
# cd /kaggle/ComfyUI




# pip install llama-cpp-python




# REMOTE_PORT="$1"

# 传入参数3,4,5,...  这样便于扩展，如果以后用了其他的frp，也好调整。

# frp execution binary only. 这里放frpc执行文件，如果版本有变也好改。配置文件模版，也在项目中, 模版文件名为template_frpc
wget -O  /kaggle/working/frp_0.54.0_linux_amd64.tar.gz https://github.com/fatedier/frp/releases/download/v0.54.0/frp_0.54.0_linux_amd64.tar.gz
tar -xzvf /kaggle/working/frp_0.54.0_linux_amd64.tar.gz -C /kaggle/working
cp -p /kaggle/working/frp_0.54.0_linux_amd64/frpc /kaggle/working/frpc

cp -p /kaggle/ComfyUI/frp_related/template_frpc_new_subdomain /kaggle/working/frpc.toml


# 1, 2 主要是为了兼容之前的comfyUI notebook（不想一个一个的去修改了）
# FRP_CONFIG_FILE="/kaggle/working/frpc.toml"
# CHOICE="$1"
# if [ "$CHOICE" -eq 3 ]; then
#   TARGET_REMOTE_PORT="21663"
# elif [ "$CHOICE" -eq 4 ]; then
#   TARGET_REMOTE_PORT="21664"

# elif [ "$CHOICE" -eq 5 ]; then
#   TARGET_REMOTE_PORT="21665"
# elif [ "$CHOICE" -eq 6 ]; then
#   TARGET_REMOTE_PORT="21666"
# elif [ "$CHOICE" -eq -1 ]; then
#   TARGET_REMOTE_PORT="21673"
# else
#   echo "Invalid CHOICE: $CHOICE"
#   echo "Only 1 or 2 are supported."
#   exit 1 # 退出并返回错误码
# fi
# sed -i "s/REMOTE_PORT/$TARGET_REMOTE_PORT/g" "$FRP_CONFIG_FILE"
# sleep 2
