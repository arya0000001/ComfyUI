
cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
cd /kaggle/ComfyUI

cd custom_nodes
git clone https://github.com/zml-w/ComfyUI-ZML-Image.git
cd ComfyUI-ZML-Image
pip install -r requirements.txt
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

# cd custom_nodes
# git clone https://github.com/Fannovel16/comfyui_controlnet_aux/
# cd comfyui_controlnet_aux
# pip install -r requirements.txt -q
# cd /kaggle/ComfyUI

# cd custom_nodes
# git clone https://github.com/ltdrdata/was-node-suite-comfyui.git
# cd was-node-suite-comfyui
# pip install -r requirements.txt -q
# cd /kaggle/ComfyUI

# cd custom_nodes
# git clone https://github.com/kijai/ComfyUI-KJNodes
# git clone https://github.com/cubiq/ComfyUI_essentials
# git clone https://github.com/evanspearman/ComfyMath
# git clone https://github.com/M1kep/ComfyLiterals
# cd /kaggle/ComfyUI

wget -O  /kaggle/working/frp_0.54.0_linux_amd64.tar.gz https://github.com/fatedier/frp/releases/download/v0.54.0/frp_0.54.0_linux_amd64.tar.gz
tar -xzvf /kaggle/working/frp_0.54.0_linux_amd64.tar.gz -C /kaggle/working
cp -p /kaggle/working/frp_0.54.0_linux_amd64/frpc /kaggle/working/frpc

cp -p /kaggle/ComfyUI/frp_related/template_frpc_new_subdomain /kaggle/working/frpc.toml

