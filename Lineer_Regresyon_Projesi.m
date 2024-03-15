% Adým 1: Veri Setinin Hazýrlanmasý
study_hours = [2, 3, 4, 5, 6, 7, 8]; % Ders çalýþma saatleri
exam_scores = [60, 65, 70, 75, 80, 85, 90]; % Sýnav notlarý

% Adým 2: Veri Görselleþtirme
figure;
scatter(study_hours, exam_scores);
xlabel('Ders Çalýþma Saati');
ylabel('Sýnav Notu');
title('Ders Çalýþma Saati ve Sýnav Notu Ýliþkisi');

% Adým 3: Lineer Regresyon Modelinin Oluþturulmasý
model = fitlm(study_hours, exam_scores);

% Adým 4: Modelin Deðerlendirilmesi
hold on;
study_hours_pred = linspace(min(study_hours), max(study_hours), 100); 
exam_scores_pred = predict(model, study_hours_pred');
plot(study_hours_pred, exam_scores_pred, 'r-');
legend('Veri Noktalarý', 'Lineer Regresyon Doðrusu');


% Adým 5: Sonuçlar
new_study_hours = 9;
predicted_exam_score = predict(model, new_study_hours);
disp([num2str(new_study_hours), ' saatlik bir çalýþma için Tahmini sýnav notu: ', num2str(predicted_exam_score)]);
