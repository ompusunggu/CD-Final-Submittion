texture = imread('Saved Pictures\Unit_4.jpg');
figure;
[height, width, dim] = size(texture);
imshow(texture);
outsize = size(texture)*0.5;
tilesize = floor((width/2)*0.8);  %256 * 80% = 
overlapsize = (tilesize*2)-floor(width/2);
isdebug = 1;
i = 1; 
while i <= 4 
    j=1;
    while j <= 4
        tic;
        figure;
        t2 = synthesize(texture,   outsize , tilesize, overlapsize, isdebug);
        
        %imwrite(uint8(t2),strcat('overlap= ', int2str(overlapsize),'_tilesize= ',int2str(tilesize),'__',int2str(i),int2str(j),'(1).jpg'),'jpg');
        imgMirrorRU = flipdim(t2,2); 
        %imwrite(uint8(imgMirrorRU),strcat('overlap= ', int2str(overlapsize),'_tilesize= ',int2str(tilesize),'__',int2str(i),int2str(j),'(2).jpg'),'jpg');
        imgMirrorLB = flipdim(t2,1);
        %imwrite(uint8(imgMirrorLB),strcat('overlap= ', int2str(overlapsize),'_tilesize= ',int2str(tilesize),'__',int2str(i),int2str(j),'(3).jpg'),'jpg');
        imgMirrorRB = flipdim(imgMirrorRU,1);
        %imwrite(uint8(imgMirrorRB),strcat('overlap= ', int2str(overlapsize),'_tilesize= ',int2str(tilesize),'__',int2str(i),int2str(j),'(4).jpg'),'jpg');
        imgResUpper = cat(2,t2,imgMirrorRU);
        imgResBottom = cat(2,imgMirrorLB,imgMirrorRB);
        imgFull = cat(1,imgResUpper, imgResBottom);
        timerVal=toc;
        imwrite(uint8(imgFull),strcat('overlap= ', int2str(overlapsize),'_tilesize= ',int2str(tilesize),'__',int2str(i),int2str(j),'(full_ teseee Kecil)',int2str(timerVal),int2str(width),'.jpg'),'jpg');
        
        j = j + 1;
    end 
    overlapsize = overlapsize + (i*2);
    tilesize = tilesize + i;
    i = i + 1;
end 


