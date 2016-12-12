function targetPiece = search(target,source)
targetSize = size(source);
sourceSize = size(target);
best = 9999999999;
targetJ = 1;
targetI = 1;
for i=1:targetSize(2)/sourceSize(2)
    for j=1:targetSize(1)/sourceSize(1)
        image= source((j-1) * sourceSize(1) + 1:(j) * sourceSize(1),(i-1) * sourceSize(2)+1:(i) * sourceSize(2),:);
        difference = sum(sum(sum(image - target).^2));
       if best > difference;
            best = difference;
            targetJ = j;
            targetI = i;
       end
       
    end
end

targetPiece = source((targetJ-1) * sourceSize(1) + 1:(targetJ) * sourceSize(1),(targetI-1) * sourceSize(2)+1:(i) * sourceSize(2),:);