close all;
clear all;

load char_c1.mat;
TomographyDisp(Achar,Bchar,imsize,1);

clear all;
load mri_c1.mat;
TomographyDisp(Amri,Bmri,imsize,2);
