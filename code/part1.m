nameSource = 'budapest';
nameTarget = 'amsterdam';
source = imread(strcat('..\images\' , nameSource , '.jpg'));
target = imread(strcat('..\images\' , nameTarget , '.jpg'));

lab_source = rgb2lab(source);
lab_target = rgb2lab(target);

source_mean_l = mean2(lab_source(:,:,1));
source_mean_a = mean2(lab_source(:,:,2));
source_mean_b = mean2(lab_source(:,:,3));

source_std_l = std2(lab_source(:,:,1));
source_std_a = std2(lab_source(:,:,2));
source_std_b = std2(lab_source(:,:,3));

target_mean_l = mean2(lab_target(:,:,1));
target_mean_a = mean2(lab_target(:,:,2));
target_mean_b = mean2(lab_target(:,:,3));

target_std_l = std2(lab_target(:,:,1));
target_std_a = std2(lab_target(:,:,2));
target_std_b = std2(lab_target(:,:,3));

target_subtracted_l = lab_target(:,:,1)  - target_mean_l;
target_subtracted_a = lab_target(:,:,2) - target_mean_a;
target_subtracted_b = lab_target(:,:,3) - target_mean_b;

scaled_l = target_subtracted_l.*(target_std_l / source_std_l);
scaled_a = target_subtracted_a.*(target_std_a / source_std_a);
scaled_b = target_subtracted_b.*(target_std_b / source_std_b);

new_target_l = scaled_l + source_mean_l;
new_target_a = scaled_a + source_mean_a;
new_target_b = scaled_b + source_mean_b;

new_target_lab = zeros(size(new_target_l, 1), size(new_target_l, 2), 3);
new_target_lab(:,:,1) = new_target_l;
new_target_lab(:,:,2) = new_target_a;
new_target_lab(:,:,3) = new_target_b;

new_target= lab2rgb(new_target_lab);

y = new_target;

imshow(y);
%imwrite(result,strcat('..\results\' , nameSource ,'_', nameTarget , '.jpg'));
