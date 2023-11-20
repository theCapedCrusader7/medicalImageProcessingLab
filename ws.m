
%%
size_ny = size(vol_ny);

vol_ny_segmented = vol_ny;
%%
for i = 1:size_ny(3)
    disp(i);
    img1 = vol_ny(:,:,i);
    se = strel('square',20);
    open_img1 = imopen(img1,se);
    %imshow(open_img1);
    erd_img1 = imerode(img1,se);
    Iobr = imreconstruct(erd_img1,img1);
    %imshow(Iobr)
    op_clos_img1 = imclose(open_img1,se);
    %imshow(op_clos_img1);
    Iobrd = imdilate(Iobr,se);
    Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
    Iobrcbr = imcomplement(Iobrcbr);
    %imshow(Iobrcbr)
    fgm = imregionalmax(Iobrcbr);
    vol_ny_segmented(:,:,i) = fgm;
    %imshow(fgm)
end
%%
volshow(vol_ny_segmented)


