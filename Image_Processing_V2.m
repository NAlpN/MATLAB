video = VideoReader('1.mp4');

% Yüklenen videoyu oynatmak için bir figure oluþtur
figure;

% Videoyu baþlat
while hasFrame(video)
    % Bir sonraki kareyi al
    frame = readFrame(video);
    
    % Gri ton dönüþümü
    gray_frame = rgb2gray(frame);
    
    % Gri tonlamalý kare
    imshow(gray_frame);
    title('Gri Tonlamalý Kare');
    
    % Her bir kareyi göstermek için
    pause(1/video.FrameRate);
end
