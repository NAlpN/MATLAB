video = VideoReader('1.mp4');

% Y�klenen videoyu oynatmak i�in bir figure olu�tur
figure;

% Videoyu ba�lat
while hasFrame(video)
    % Bir sonraki kareyi al
    frame = readFrame(video);
    
    % Gri ton d�n���m�
    gray_frame = rgb2gray(frame);
    
    % Gri tonlamal� kare
    imshow(gray_frame);
    title('Gri Tonlamal� Kare');
    
    % Her bir kareyi g�stermek i�in
    pause(1/video.FrameRate);
end
