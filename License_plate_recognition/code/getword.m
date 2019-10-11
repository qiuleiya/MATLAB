function [ word, result ] = getword( img )
%×ÖÄ¸Êý×Ö

    word = [];
    flag = 0;
    y1 = 8;
    y2 = 0.5;
    
    while flag == 0
        [m, n] = size(img);
        width = 0;
        while sum(img(:, width+1)) ~= 0 && width <= n-2
            width = width + 1;
        end
        temp = imsplit(imcrop(img, [1,1,width,m]));
        [m1, n1] = size(temp);
        if width < y1 && n1/m1>y2
            img(:, [1, width]) = 0;
            if sum(sum(img)) ~= 0
                img = imsplit(img);% ÇÐ¸î³ö×îÐ¡·¶Î§
            else
                word = [];
                flag = 1;
            end
        else
            word = imsplit(imcrop(img, [1, 1, width, m]));
            img(:, [1: width]) = 0;
            if sum(sum(img)) ~= 0
                img = imsplit(img);
                flag = 1;
            else
                img = [];
            end   
        end
    end

    result = img;
end





