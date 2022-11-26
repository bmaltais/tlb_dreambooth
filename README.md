# HOWTO

This repo provide a local solution to run "The Last Ben" Dreambooth on Windows: https://github.com/TheLastBen/fast-stable-diffusion

Credits to him for the modified diffusers code.

## Required Dependencies

Python 3.10.6 and Git:

- Python 3.10.6: https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe
- git: https://git-scm.com/download/win

Give unrestricted script access to powershell so venv can work:

- Open an administrator powershell window
- Type `Set-ExecutionPolicy Unrestricted` and answer A
- Close admin powershell window

## Installation

Open a regular Powershell terminal and type the following inside:

```powershell
git clone https://github.com/bmaltais/kohya_ss.git
cd kohya_ss
python -m venv --system-site-packages venv
.\venv\Scripts\activate

pip install torch==1.12.1+cu116 torchvision==0.13.1+cu116 --extra-index-url https://download.pytorch.org/whl/cu116

pip install --upgrade diffusers
pip install -r requirements.txt
pip install OmegaConf
pip install pytorch_lightning
pip install tensorboard

pip install -U -I --no-deps https://github.com/C43H66N12O12S2/stable-diffusion-webui/releases/download/f/xformers-0.0.14.dev0-cp310-cp310-win_amd64.whl

# Setup bitsandbytes with Adam8bit support for windows: https://note.com/kohya_ss/n/n47f654dc161e
pip install bitsandbytes==0.35.0
cp .\bitsandbytes_windows\*.dll .\venv\Lib\site-packages\bitsandbytes\
cp .\bitsandbytes_windows\cextension.py .\venv\Lib\site-packages\bitsandbytes\cextension.py
cp .\bitsandbytes_windows\main.py .\venv\Lib\site-packages\bitsandbytes\cuda_setup\main.py

accelerate config:
- 0
- 0
- NO
- NO
- All
- fp16
```

## Execution

Look at the train.ps1 powershell script for an example of how to use this Dreambooth solution.

## Change history

* 11/26 (v1): Support training for sd14, sd15, sd20-512 and sd20-768