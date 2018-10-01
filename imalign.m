function [ shift_vector ] = imalign(a,b)
%% gaussian pyramid

% doing this with a low resolution image:
% (1) crop the images
%% Crop A
sizeA = size(a);
heightA = sizeA(1);
widthA = sizeA(2);
cropBorderHeightA = floor(heightA/10);
cropBorderWidthA = floor(widthA/10);
croppedA = a(cropBorderHeightA:heightA-cropBorderHeightA,cropBorderWidthA:widthA-cropBorderWidthA);

%% Crop B
sizeB = size(b);
heightB = sizeB(1);
widthB = sizeB(2);
cropBorderHeightB = floor(heightB/10);
cropBorderWidthB = floor(widthB/10);
croppedB = b(cropBorderHeightB:heightB-cropBorderHeightB,cropBorderWidthB:widthB-cropBorderWidthB);
if(heightA<700||widthA<700) 
    shift_vector = bestShift(croppedA,croppedB,15);
%     shift_vector = bestShiftPyramid(croppedA,croppedB,9,4);

else
     shift_vector = bestShiftPyramid(croppedA,croppedB,9,4)
%shift_vector = [0,0];
end
end
%% Sum of squared differences:
function result = ssd(a,b)
result = sum((a-b).^2,'all');
end

