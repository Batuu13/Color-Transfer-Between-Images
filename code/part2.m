nameSource = 'm1';
nameTarget = 'm2';
sourceReal = imread(strcat('..\images\' , nameSource , '.jpg'));
targetReal = imread(strcat('..\images\' , nameTarget , '.jpg'));


sizeSource = size(sourceReal);
sizeTarget = size(targetReal);
result = zeros(sizeTarget);
x_count = 500;
y_count = 5;

for i = 1:x_count
    for j = 1:y_count
        valueX_source = (sizeSource(2)/x_count);
        valueY_source = (sizeSource(1)/y_count);
        valueX_target = (sizeTarget(2)/x_count);
        valueY_target = (sizeTarget(1)/y_count);
        
        
        targetPiece = targetReal((j-1) * valueY_target + 1:(j) * valueY_target,(i-1) * valueX_target+1:(i) * valueX_target,:);
        
        sourcePiece = search(targetPiece,sourceReal);
        resultPiece = transfer(sourcePiece,targetPiece);
        result((j-1) * valueY_target + 1:(j) * valueY_target,(i-1) * valueX_target+1:(i) * valueX_target,:) = resultPiece;
    end
end

figure
imshow(result);
imwrite(result,strcat('..\results\' , nameSource ,'_', nameTarget ,'-',int2str(x_count),'_',int2str(y_count),'.jpg'));
