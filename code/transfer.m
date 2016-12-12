function result = transfer(source,target)
source_lab = rgb2lab(source);
target_lab = rgb2lab(target);

source_lab_l = source_lab(:,:,1);
source_lab_a = source_lab(:,:,2);
source_lab_b = source_lab(:,:,3);

target_lab_l = target_lab(:,:,1);
target_lab_a = target_lab(:,:,2);
target_lab_b = target_lab(:,:,3);

source_lab_mean_l = mean(mean(source_lab_l));
source_lab_mean_a = mean(mean(source_lab_a));
source_lab_mean_b = mean(mean(source_lab_b));

source_lab_std_l = std2(source_lab_l);
source_lab_std_a = std2(source_lab_a);
source_lab_std_b = std2(source_lab_b);

target_lab_mean_l = mean(mean(target_lab_l));
target_lab_mean_a = mean(mean(target_lab_a));
target_lab_mean_b = mean(mean(target_lab_b));

target_lab_std_l = std2(target_lab_l);
target_lab_std_a = std2(target_lab_a);
target_lab_std_b = std2(target_lab_b);

target_lab_l = target_lab_l - target_lab_mean_l;
target_lab_a = target_lab_a - target_lab_mean_a;
target_lab_b = target_lab_b - target_lab_mean_b;

target_lab_l = target_lab_l.* (target_lab_std_l / source_lab_std_l);
target_lab_a = target_lab_a.* (target_lab_std_a / source_lab_std_a);
target_lab_b = target_lab_b.* (target_lab_std_b / source_lab_std_b);

target_lab_l = target_lab_l + source_lab_mean_l;
target_lab_a = target_lab_a + source_lab_mean_a;
target_lab_b = target_lab_b + source_lab_mean_b;

target_lab_new(:,:,1) = target_lab_l;
target_lab_new(:,:,2) = target_lab_a;
target_lab_new(:,:,3) = target_lab_b;

result = lab2rgb(target_lab_new);
