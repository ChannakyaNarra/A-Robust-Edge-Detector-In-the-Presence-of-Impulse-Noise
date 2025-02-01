function [ nim ] = nonMaxSupp(im)
[m,n]=size(im);
nim=uint8(zeros(size(im)));
Mx = [-1 0 1; -2 0 2; -1 0 1];
My = [-1 -2 -1; 0 0 0; 1 2 1];
ang = 0;
for i=2:m-2
    for j=2:n-2
        %if im(i,j) ~= 0
            Gx = sum(sum(Mx.*im(i:i+2, j:j+2)));
            Gy = sum(sum(My.*im(i:i+2, j:j+2)));
            ang = atan2(Gy,Gx);
        %end
        if (ang>=340 || ang<=22.5) || (ang>=157.5 && ang<=202.5)  %horizontal
            if (im(i,j+1)>im(i,j)) || (im(i,j-1)>im(i,j))
                nim(i,j)=1;
            end

        elseif (ang>22.5 && ang<=67.5) || (ang>202.5 && ang<=247.5) %45
            if (im(i+1,j-1)>im(i,j)) || (im(i-1,j+1)>im(i,j))
                nim(i,j)=1;
            end
        elseif (ang>67.5 && ang<=112.5) || (ang>247.5 && ang<=292.5) %vertical
            if (im(i-1,j)<im(i,j)) ||(im(i+1,j)<im(i,j))
                nim(i,j)=1;
            end
        else %135
            if (im(i-1,j-1)>im(i,j)) || (im(i+1,j+1)>im(i,j))
                nim(i,j)=1;
            end
        end
    end
end

