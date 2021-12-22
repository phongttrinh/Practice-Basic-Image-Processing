% Phong Thanh Trinh
[file,path] = uigetfile('.bmp');   % Open file selection dialog box

if isequal(file,0)                 % if Did the user select a file name?
  
   disp('No file selected... ');   % If file is blank display message

else
end  
x = imread(fullfile(path,file));        % Load image
x_info=imfinfo(fullfile(path,file));    % Load info on image

W=x_info.Width;                 % W = image width
H=x_info.Height;                % H = image height
L=x_info.NumColormapEntries;    % L = image depth

imshow(x, [0 (L-1)]);           % Display image with grayscale
                                % values in the range 0 to L-1 (255)
pause
close all

histo=zeros(L,1); % beginnings maxtrix of Histogram with L rows and 1 coulmum 
for i =1:W        %  the loop of width 
    for j=1:H     % the second loop of Height 
        histo(x(j,i)+1)=histo(x(j,i)+1)+1; % creating Histogram of pixels matrix starting at 1 to 255
    end % end for the second loop with the Height
end  % end for the second loop with the wight
figure(1) % Display figure 1
bar(histo); % Diplay the bar graph of the histogram 
grid on % show the grid
prompt='Enter the value of A:'; % User promopt variable A
A = input(prompt); % input the value of A
prompt ='Enter the value of B:'; % User prompt variable B
B = input(prompt); % input the value of B
y = zeros (H, W, 'uint8');

    
for i =1:W %  The loop of width 
    for j =1:H  % The second loop of Height
        if x(j,i)<=A % the first statement: if x less or equal A then y = 0
           y(j,i)=0; 
        elseif x(j,i)>=B % the second statement: if x more or equal B then y = L - 1
            y(j,i)=(L-1);
        else
            y(j,i)=((double(x(j,i))- A)/(B-A))*(L-1); % the third statement: if not, y(j,i)=((double(x(j,i))- A)/(B-A))*(L-1)
        end
    end
end

imshow(y,[0 (L-1)])  % Display image with grayscale and values in the range 0 to L-1 (255)


histo2 = zeros(L,1); % Transformed histogram begins with zeros maxtrix with L rows and 1 comlum
for i = 1:W % the loop of width 
    for j = 1:H %the loop of height
        histo2(y(j,i)+1)= histo2(y(j,i)+1)+1;% creating Histogram of pixels matrix starting at 1 to 255
    end
end
figure(2) % Display the figure 2

figure(3) % Display the figure 3
bar(histo2); % Diplay the bar graph of the transformed histogram 
pause 
close all


