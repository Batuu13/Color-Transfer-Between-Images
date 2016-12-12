
function lab = rgb2lab(im)
a = [0.3811 0.5783 0.0402;0.1967 0.7244 0.0782;0.0241 0.1288 0.8444];
b = [1/sqrt(3) 0 0;0 1/sqrt(6) 0;0 0 1/sqrt(2)];
c = [1 1 1;1 1 -2;1 -1 0];
img = reshape(im2double(im),[],3);

img = max(img,1/255);

% convert to LMS space
LMS = a*img';
LMS = log10(LMS);

% convert to lab space
lab = b*c*LMS;
lab=reshape(lab', size(im));