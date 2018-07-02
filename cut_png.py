#!/usr/bin/python3

###################################################################
#    File name     : cut_png.py
#    Author        : doggy
#    Date          : 2018年07月02日 星期一 08时47分19秒
#    Description   : 
###################################################################

from PIL import Image
import matplotlib.pyplot as plt
import time

def cut_png(pngfname, size):
    pngf = Image.open(pngfname)
    region = pngf.crop(size)
    return region

def save_png(pngfname, region):
    region.save(pngfname)

def main():
    pngfname = "Structure.png"
    size = (128, 60, 720, 528)
    region = cut_png(pngfname, size)

    plt.figure()
    plt.axis('off')
    plt.imshow(region)
    plt.show()

main()
