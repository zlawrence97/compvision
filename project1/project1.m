% CS194-26 (cs219-26): Project 1, starter Matlab code

% name of the input file
imname = 'field.jpg';

% read in the image
fullim = imread(imname);

% convert to double matrix (might want to do this later on to same memory)
fullim = im2double(fullim);

% compute the height of each part (just 1/3 of total)
height = floor(size(fullim,1)/3);
% separate color channels
B = fullim(1:height,:);
G = fullim(height+1:height*2,:);
R = fullim(height*2+1:height*3,:);

% Align the images
% Functions that might be useful to you for aligning the images include: 
% "circshift", "sum", and "imresize" (for multiscale)
%aG = sum(G,B);
%aR = sum(R,B);

% G and R
% Find highest correlation between G and R slices 
C = normxcorr2(G,R);
[row col] = find(C == max(max(C)))

[height width] = size(G)

% Offset accounts for the padding given by normxcorr2 
offsetX=width - col
offsetY=height - row

G2 = zeros(size(G));
for n=1:height
    if n-offsetY>0 & n-offsetY<height
        G2(n-offsetY,:) = G(n,:);
    end
end

G3 = zeros(size(G));
for n=1:height
    if n-offsetX>0 & n-offsetX<height
        G3(n-offsetX,:) = G2(n,:);
    end
end

% newColorImage(:,:,3) = B;
newColorImage(:,:,1) = R;
newColorImage(:,:,2) = G2;


% % B and R
%
C=normxcorr2(R,B);
[row col] = find(C==max(max(C)))

[height width] = size(B)





offsetX=width -col
offsetY=height - row

B2 = zeros(size(B));
for n=1:height
    if n+offsetY>0 & n+offsetY<height
        B2(n+offsetY,:) = B(n,:);
    end
end

B3 = zeros(size(B));
for n=1:height
    if n+offsetX>0 & n+offsetX<height
        B3(n+offsetX,:) = B2(n,:);
    end
end

aligned_field(:,:,1) = R;
aligned_field(:,:,2) = G3;
aligned_field(:,:,3) = B3;

aligned_field = aligned_field(20:height-10,25:width-20,:);
imshow(aligned_field);