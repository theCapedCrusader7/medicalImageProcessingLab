filePath = 'E:/iith/sem7/BM4081/frames/1/frame-dicom-00036.dcm';
dicomInfo = dicominfo(filePath);
originalImage = dicomread(dicomInfo);
originalImage=rgb2gray(originalImage);
preprocessedImage = medfilt2(originalImage); 
enhancedImage = imadjust(preprocessedImage,[],[],2); 
radius = 2;
se = strel('disk',radius);
segImage=imerode(enhancedImage,se);
len = 2;
se=strel('line',len,90);
segImage2=imerode(segImage,se);
img = imcrop(segImage2,[160.5 123.5 378 80]);
imwrite(img,'E:/iith/sem7/BM4081/croppedFrames/1/cropped36.png')