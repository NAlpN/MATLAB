cam = webcam(0);

faceDetector = vision.CascadeObjectDetector;

while true
    frame = snapshot(cam);
    
    bbox = step(faceDetector, frame);
    
    if ~isempty(bbox)
        detectedImg = insertObjectAnnotation(frame, 'rectangle', bbox, 'Yuz', 'LineWidth', 3);
        imshow(detectedImg);
    else
        imshow(frame);
    end
    
    if strcmpi(get(gcf, 'currentkey'), 'q')
        break;
    end
end

clear cam;
