function image = resize(a)
% (1) apply gaussian blur. blur 2x.
image = imgaussfilt(a,2);
% (2) take every other row and column.
image = image(1:2:end,1:2:end);
end

