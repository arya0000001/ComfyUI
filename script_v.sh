ln -s /kaggle/input/clip-vision-h/clip_vision_h.safetensors ./models/clip_vision/clip_vision_h.safetensors
ln -s /kaggle/input/umt5-xxl-fp8-e4m3fn-scaled/umt5_xxl_fp8_e4m3fn_scaled.safetensors ./models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors
ln -s /kaggle/input/wan-2-1-vae/wan_2.1_vae.safetensors ./models/vae/wan_2.1_vae.safetensors
ln -s /kaggle/input/wan-animate-q3-k-m-gguf/Wan2.2-Animate-14B-Q3_K_M.gguf ./models/diffusion_models/Wan2.2-Animate-14B-Q3_K_M.gguf
ln -s /kaggle/input/wan2-2-animate-14b-q4-k-s/Wan2.2-Animate-14B-Q4_K_S.gguf ./models/diffusion_models/Wan2.2-Animate-14B-Q4_K_S.gguf
ln -s /kaggle/input/wananimate-relight-lora-fp16/WanAnimate_relight_lora_fp16.safetensors ./models/loras/WanAnimate_relight_lora_fp16.safetensors
ln -s /kaggle/input/lightx2v-i2v-14b-480p-cfg-step-distill-rank64-bf16/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors ./models/loras/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
ln -s /kaggle/input/bouncev-01/bounceV_01.safetensors ./models/loras/bounceV_01.safetensors
ln -s /kaggle/input/bouncehighwan2-2/BounceHighWan2_2.safetensors ./models/loras/BounceHighWan2_2.safetensors
ln -s /kaggle/input/bouncelowwan2-2/BounceLowWan2_2.safetensors ./models/loras/BounceLowWan2_2.safetensors

cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
cd /kaggle/ComfyUI

#ComfyUI-GGUF
cd custom_nodes
git clone https://github.com/city96/ComfyUI-GGUF
cd ComfyUI-GGUF
pip install --upgrade gguf
cd /kaggle/ComfyUI

#encrypt image
cd custom_nodes
git clone https://github.com/Vander-Bilt/comfyui-encrypt-image.git
cd /kaggle/ComfyUI

cd custom_nodes
# git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git
git clone https://github.com/Vander-Bilt/ComfyUI-VideoHelperSuite.git
cd ComfyUI-VideoHelperSuite
pip install -r requirements.txt
cd /kaggle/ComfyUI

cd custom_nodes
git clone https://github.com/Fannovel16/comfyui_controlnet_aux/
cd comfyui_controlnet_aux
pip install -r requirements.txt -q
cd /kaggle/ComfyUI

cd custom_nodes
git clone https://github.com/ltdrdata/was-node-suite-comfyui.git
cd was-node-suite-comfyui
pip install -r requirements.txt -q
cd /kaggle/ComfyUI

cd custom_nodes
git clone https://github.com/kijai/ComfyUI-KJNodes
git clone https://github.com/cubiq/ComfyUI_essentials
git clone https://github.com/evanspearman/ComfyMath
git clone https://github.com/M1kep/ComfyLiterals
cd /kaggle/ComfyUI

wget -O  /kaggle/working/frp_0.54.0_linux_amd64.tar.gz https://github.com/fatedier/frp/releases/download/v0.54.0/frp_0.54.0_linux_amd64.tar.gz
tar -xzvf /kaggle/working/frp_0.54.0_linux_amd64.tar.gz -C /kaggle/working
cp -p /kaggle/working/frp_0.54.0_linux_amd64/frpc /kaggle/working/frpc

cp -p /kaggle/ComfyUI/frp_related/template_frpc_new_subdomain /kaggle/working/frpc.toml

