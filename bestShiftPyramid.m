function vector = bestShiftPyramid(a,b,t,n)
shift = [0,0];
if n == 0
    shift = bestShift(a, b, t); 
else
    shift = bestShiftPyramid(resize(a), resize(b),t, n-1)*2; 
    shifted = circshift(b, shift);
    shift = shift + bestShift(a, shifted, 3);
end
vector = shift;
end
