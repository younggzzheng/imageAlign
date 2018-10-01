
clear;

%% Project 1: Color Alignment
%
% author: Young Zheng
% login: zzheng9
% data:
%

% The stencil code for this assignment includes:
%   - reading the 16 images that we have stored locally
%   - calling an 'imalign' function
%   - combining the image into an RGB image
%   - writing that image out to a jpg
% 
% 
% Remember to use other images from the collection or you will 
% not get full credit!

N = 18;

in_names = cell(18,1);
in_names{1}        = '00125v.jpg';
in_names{2}        = '00149v.jpg';
in_names{3}        = '00153v.jpg';
in_names{4}        = '00154v.jpg';
in_names{5}        = '00163v.jpg';
in_names{6}        = '00270v.jpg';
in_names{7}        = '00398v.jpg';
in_names{8}        = '00458u.tif'; % Notice that some of these are tif's
in_names{9}        = '00564v.jpg';
in_names{10}       = '00911u.tif';
in_names{11}       = '01043u.tif';
in_names{12}       = '01047u.tif';
in_names{13}       = '01167v.jpg';
in_names{14}       = '01657u.tif';
in_names{15}       = '01861a.tif';
in_names{16}       =  '31421v.jpg';
in_names{17}       =  'my1.tif';
in_names{18}       =  'my2.tif';

% img_dir = '/Users/youngzheng/Desktop/Computational Photography/Project 1/proj1/data';
img_dir = '../data';

% Write out to jpg, it's much smaller than a tif

out_names = cell(18,1);
out_names{1}        = '00125v.jpg';
out_names{2}        = '00149v.jpg';
out_names{3}        = '00153v.jpg';
out_names{4}        = '00154v.jpg';
out_names{5}        = '00163v.jpg';
out_names{6}        = '00270v.jpg';
out_names{7}        = '00398v.jpg';
out_names{8}        = '00458u.jpg';
out_names{9}        = '00564v.jpg';
out_names{10}       = '00911u.jpg';
out_names{11}       = '01043u.jpg';
out_names{12}       = '01047u.jpg';
out_names{13}       = '01167v.jpg';
out_names{14}       = '01657u.jpg';
out_names{15}       = '01861a.jpg';
out_names{16}       = '31421v.jpg';
out_names{17}       = 'my1.jpg';
out_names{18}       = 'my2.jpg';


out_dir = 'images';

jpg_quality = 90;

for i=1:18
    tic
    display(in_names{i})
    in_image = im2double( imread( [img_dir,'/',in_names{i}] ) );
    height = floor(size(in_image,1)/3.0);
    blue = in_image( 1:height , : );
    green = in_image( height + 1 : 2 * height , : );
    red = in_image( 2 * height + 1 : 3 * height , :);

    % You need to implement an imalign function
    green_shift = imalign(blue, green);
    red_shift = imalign(blue, red); 

    green = circshift(green,green_shift);
    red = circshift(red,red_shift);
    green = contrast(green);
    red = contrast(red);
    blue=contrast(blue);
    out_image = im2uint8( cat(3,red,green,blue) );
    toc
    
    
    imwrite(out_image, [ out_dir '/' out_names{i}], 'Quality', jpg_quality );
end
%%

