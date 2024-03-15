% Ad�m 1: Veri Setinin Haz�rlanmas�
study_hours = [2, 3, 4, 5, 6, 7, 8]; % Ders �al��ma saatleri
exam_scores = [60, 65, 70, 75, 80, 85, 90]; % S�nav notlar�

% Ad�m 2: Veri G�rselle�tirme
figure;
scatter(study_hours, exam_scores);
xlabel('Ders �al��ma Saati');
ylabel('S�nav Notu');
title('Ders �al��ma Saati ve S�nav Notu �li�kisi');

% Ad�m 3: Lineer Regresyon Modelinin Olu�turulmas�
model = fitlm(study_hours, exam_scores);

% Ad�m 4: Modelin De�erlendirilmesi
hold on;
study_hours_pred = linspace(min(study_hours), max(study_hours), 100); 
exam_scores_pred = predict(model, study_hours_pred');
plot(study_hours_pred, exam_scores_pred, 'r-');
legend('Veri Noktalar�', 'Lineer Regresyon Do�rusu');


% Ad�m 5: Sonu�lar
new_study_hours = 9;
predicted_exam_score = predict(model, new_study_hours);
disp([num2str(new_study_hours), ' saatlik bir �al��ma i�in Tahmini s�nav notu: ', num2str(predicted_exam_score)]);
