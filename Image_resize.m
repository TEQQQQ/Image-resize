clc,clear all, close all
res = imread('indir.jpg')
imshow(res);
[m,n,katman] = size(res)

R = res(:,:,1);
G = res(:,:,2);
B = res(:,:,3);

satir = 1;

for i = 1: m
    sutun = 1;
    for j = 1 : n
        bR(satir:satir+4,sutun:sutun+4) = R(i,j);
        bG(satir:satir+4,sutun:sutun+4) = G(i,j);
        bB(satir:satir+4,sutun:sutun+4) = B(i,j);
        sutun = sutun +5;
    end
    satir = satir +5;
end

gri = (double(bR)+double(bG)+double(bB))/3;
figure, imshow(uint8(gri))

[w,h,katman] = size(gri)

row = 1;
for i = 1 : 2 : w-1
    col = 1;
    for j = 1 : 2 : h-1
        blok = gri(i:i+1,j:j+1);
        deger = mean(blok(:));
        yresim(row,col) = deger;
        col = col +1;
    end
    row = row +1;
end

figure, imshow(uint8(yresim))

