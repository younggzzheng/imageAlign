%% bestShift:
% This function gives the best shift within input threshold t.
% a moves. b is stationary.
function vector = bestShift(a,b,t)
maxXOffset=t;
maxYOffset=t;
[aheight, awidth] = size(a);
[bheight, bwidth] = size(b);

windowStationary = a(floor(aheight/30):aheight-floor(aheight/30),floor(awidth/30):awidth-floor(awidth/30)); % cropping image to set a middle window
windowMoving =     b(floor(bheight/30):bheight-floor(bheight/30),floor(bwidth/30):bwidth-floor(bwidth/30)); % cropping image to set a middle window

minimumScore = Inf;
result = [0,0];
for xshift = -maxXOffset:maxXOffset
    for yshift = -maxYOffset:maxYOffset
        shifted = circshift(windowMoving,[xshift,yshift]);
        score = ssd(shifted,windowStationary);
        if (score < minimumScore) 
            minimumScore = score;
            result = [xshift,yshift];
        end
    end
end
vector = result;
end

%% Sum of squared differences:
function result = ssd(a,b)
result = sum((a-b).^2,'all');
end