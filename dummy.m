swe_map = imcrop(swe_im);
%%
imshow(swe_map)
sz_swe = size(swe_map);
[r_swe,c_swe] = find((swe_map(:,:,1)-swe_map(:,:,2) + swe_map(:,:,2)-swe_map(:,:,3))> 80);
disp(sz_swe);
filled_swe = swe_map;
%%
for i = 1:sz_swe(1)
    for j = 1:sz_swe(2)
       if (swe_map(i,j,1)-swe_map(i,j,2) < 30) && (swe_map(i,j,2)-swe_map(i,j,3) < 30)
           
           distances = sqrt((r_swe - i).^2 + (c_swe - j).^2);
           %size(distances)
           [~,index_swe] = min(distances);
           disp(index_swe);
           filled_swe(i,j,:) = swe_map(r_swe(index_swe),c_swe(index_swe),:);

       end
    end
end
disp(sz_swe)
%%
imshow(filled_swe)
%%
imshow(swe_map(90:110,50:70,:))
%%
swe_map(90,70,:)

