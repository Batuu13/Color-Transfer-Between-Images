function rgb = lab2rgb(lab)
res_lab = reshape(lab,[],3);

b2 = [sqrt(3)/3 0 0;0 sqrt(6)/6 0;0 0 sqrt(2)/2];
c2 = [1 1 1;1 1 -1;1 -2 0];

% convert to LMS
LMS_res=c2*b2*res_lab';
for ch = 1:3
    LMS_res(ch,:) = 10.^LMS_res(ch,:);
end

% convert  to RGB
est_im = ([4.4679 -3.5873 0.1193;-1.2186 2.3809 -0.1624;0.0497 -0.2439 1.2045]*LMS_res)';
rgb = reshape(est_im,size(lab)); % reshape the image
