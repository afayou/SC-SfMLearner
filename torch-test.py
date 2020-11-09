
import torch
import torchvision.models as models

import numpy as np

#encoder = torch.hub.load('facebookresearch/WSL-Images', 'resnext101_32x8d_wsl')
#encoder = models.resnet18(True)
encoder = models.resnet101(True)

print("---- " + encoder.__class__.__name__)

for name, module in encoder.named_children():
    print("==" + name)
    #print(module)

num_ch_enc = np.array([64, 64, 128, 256, 512])
print(num_ch_enc)
num_ch_enc[1:] *= 4
print(num_ch_enc)
