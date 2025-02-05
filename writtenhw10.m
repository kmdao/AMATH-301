clear all; close all; clc
%Problem 1
load('training_images.mat'); %93x40,000 matrix named training_data
h = 200;
w = 200;
[m, n] = size(training_data)

%Part A
img = reshape(training_data(40, :), [200, 200]);
imshow(img, []);

%Part B
avg_img = mean(training_data);
figure()
imshow(reshape(avg_img, [200, 200]), []);

X = training_data - ones(m, 1) * avg_img;

%Part C
[U, S, V] = svd(X, 'econ');
scores = X * V;

%Part D
figure()
for k = 1:2
    img = reshape(V(:, k), [h, w]);
    subplot(1, 2, k);
    imshow(img, []);
end

%Part E plot right?
s = diag(S);
E = cumsum(s.^2) / sum(s.^2);

figure()
plot(E, 'ko');
title('rescaled energies');
xlabel('k');
ylabel('E_k');

%Part F k=79
for k = 1:93
    if E(k) > 0.99
        break;
    end
end

%Part G
figure()
N = 40;
Uk = U(:, 1:N);
Sk = diag(s(1:N));
scores_k = Uk*Sk;
Vk = V(1, 1:N);
reconstructed_Xk = scores_k * Vk';
reconstructed_image = reconstructed_Xk(40, :) + avg_img;
imshow(reshape(reconstructed_image, [200, 200]), []);

%Problem 2
load('testing_images.mat');
[a, b] = size(testing_data);

%Part A
Y = testing_data - ones(a, 1) * avg_img;
scores_test = Y*V;

%Part B
n = 93;
distances = zeros(1, n);

for i = 1:n
    distances(i) = norm(scores_test(1, :) - scores(i, :))
end

[~, index1] = min(distances);

%Part C
distances_22 = zeros(22, n);
index_vals_Boris = zeros(1, 22);
Boris_incorrect = 0;

for i = 1:22
    for j = 1:n
        distances_22(i, j) = norm(scores_test(i, :) - scores(j, :));
    end
    [~, index] = min(distances_22(i, :));
    index_vals_Boris(i) = index;
    if index_vals_Boris(i) > 53
        Boris_incorrect = Boris_incorrect + 1;
    end
    Boris_correct_percent = ((53 - Boris_incorrect) / 53) * 100;
end

%Part D
distances_16 = zeros(16, n);
index_vals_Nandor = zeros(1, 16);
Nandor_incorrect = 0;

for i= 1:16
    for j = 1:n
        distances_16(i, j) = norm(scores_test(22+i, :) - scores(j, :));
    end
    [~, index] = min(distances_16(i, :));
    index_vals_Nandor(i) = index;
    if index_vals_Nandor(i) < 54
        Nandor_incorrect = Nandor_incorrect + 1;
    end
    Nandor_correct_percent = ((16 - Nandor_incorrect) / 16) * 100;
end








