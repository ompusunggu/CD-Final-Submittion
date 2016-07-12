texture = imread('Saved Pictures\Unit_11.jpg');
figure;

imshow(texture);



outsize = size(texture);
tilesize = 50;  %256 * 80% = 
overlapsize = 3;
isdebug = 1;
i = 1; 
while i <= 10 
    j=1;
    while j <= 1
        tic;
        figure;
        t2 = synthesize(texture,   outsize , tilesize, overlapsize, isdebug);
        
        %imwrite(uint8(t2),strcat('overlap= ', int2str(overlapsize),'_tilesize= ',int2str(tilesize),'__',int2str(i),int2str(j),'(1).jpg'),'jpg');
        imgMirrorLU = flipdim(t2,2); 
        %imwrite(uint8(imgMirrorRU),strcat('overlap= ', int2str(overlapsize),'_tilesize= ',int2str(tilesize),'__',int2str(i),int2str(j),'(2).jpg'),'jpg');
        imgMirrorRB = flipdim(t2,1);
        %imwrite(uint8(imgMirrorLB),strcat('overlap= ', int2str(overlapsize),'_tilesize= ',int2str(tilesize),'__',int2str(i),int2str(j),'(3).jpg'),'jpg');
        imgMirrorLB = flipdim(imgMirrorLU,1);
        %imwrite(uint8(imgMirrorRB),strcat('overlap= ', int2str(overlapsize),'_tilesize= ',int2str(tilesize),'__',int2str(i),int2str(j),'(4).jpg'),'jpg');
        imgResUpper = cat(2,imgMirrorLU,t2);
        imgResBottom = cat(2,imgMirrorLB,imgMirrorRB);
        imgFull = cat(1, imgResBottom,imgResUpper);
        timerVal=toc;
        imwrite(uint8(imgFull),strcat('overlap= ', int2str(overlapsize),'_tilesize= ',int2str(tilesize),'__',int2str(i),int2str(j),'(full_ Unit Kecil)',int2str(timerVal),'.jpg'),'jpg');
        
        j = j + 1;
    end 
    overlapsize = overlapsize + 1;
    tilesize = tilesize + 2;
    i = i + 1;
end 


