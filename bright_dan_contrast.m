% Citra Asli 1
imgsatu = imread('/Users/mac/Documents/zacky/gmbr1.jpeg');
img1 = rgb2gray(imgsatu);

% Brightness 1
bright_img1 = img1 + 60;

% Contrast 1
contrast_img1 = 1.5 * img1;

% Menghitung MSE antara citra asli dan citra hasil modifikasi (brightness dan contrast)
[mse_bright_img1, rmse_bright_img1] = calculateMSEandRMSE(img1, bright_img1);
[mse_contrast_img1, rmse_contrast_img1] = calculateMSEandRMSE(img1, contrast_img1);

% Citra Asli 2
imgdua = imread('/Users/mac/Documents/zacky/gmbr2.jpeg');
img2 = rgb2gray(imgdua);

% Brightness 2
bright_img2 = img2 + 60;

% Contrast 2
contrast_img2 = 1.5 * img2;

[mse_bright_img2, rmse_bright_img2] = calculateMSEandRMSE(img2, bright_img2);
[mse_contrast_img2, rmse_contrast_img2] = calculateMSEandRMSE(img2, contrast_img2);

% Citra Asli 3
imgtiga = imread('/Users/mac/Documents/zacky/gmbr3.jpeg');
img3 = rgb2gray(imgtiga);

% Brightness 3
bright_img3 = img3 + 60;

% Contrast 3
contrast_img3 = 1.5 * img3;

[mse_bright_img3, rmse_bright_img3] = calculateMSEandRMSE(img3, bright_img3);
[mse_contrast_img3, rmse_contrast_img3] = calculateMSEandRMSE(img3, contrast_img3);

fprintf('\nMSE Brightness 1: %.2f\n', mse_bright_img1);
fprintf('RMSE Brightness 1: %.2f\n\n', rmse_bright_img1);
fprintf('MSE Contrast 1: %.2f\n', mse_contrast_img1);
fprintf('RMSE Contrast 1: %.2f\n\n', rmse_contrast_img1);
fprintf('MSE Brightness 2: %.2f\n', mse_bright_img2);
fprintf('RMSE Brightness 2: %.2f\n\n', rmse_bright_img2);
fprintf('MSE Contrast 2: %.2f\n', mse_contrast_img2);
fprintf('RMSE Contrast 2: %.2f\n\n', rmse_contrast_img2);
fprintf('MSE Brightness 3: %.2f\n', mse_bright_img3);
fprintf('RMSE Brightness 3: %.2f\n\n', rmse_bright_img3);
fprintf('MSE Contrast 3: %.2f\n', mse_contrast_img3);
fprintf('RMSE Contrast 3: %.2f\n', rmse_contrast_img3);

% Tampilkan hasil image show
figure;
subplot(3, 3, 1); imshow(img1); title('Citra Asli 1');
subplot(3, 3, 2); imshow(bright_img1); title('Brightness 1');
subplot(3, 3, 3); imshow(contrast_img1); title('Contrast 1');
subplot(3, 3, 4); imshow(bright_img1 + contrast_img1); title('Gabungan 1');

% Citra Asli 2
subplot(3, 3, 5); imshow(img2); title('Citra Asli 2');
subplot(3, 3, 6); imshow(bright_img2); title('Brightness 2');
subplot(3, 3, 7); imshow(contrast_img2); title('Contrast 2');

% Citra Asli 3
subplot(3, 3, 8); imshow(bright_img3); title('Citra Asli 3');
subplot(3, 3, 9); imshow(contrast_img3); title('Contrast 3');

function [mse, rmse] = calculateMSEandRMSE(img1, img2)
    % Pastikan kedua gambar memiliki dimensi yang sama
    assert(all(size(img1) == size(img2)), 'Gambar harus memiliki dimensi yang sama');

    % Ambil dimensi gambar
    [M, N] = size(img1);

    % Inisialisasi variabel untuk menyimpan total kesalahan kuadrat
    totalSquaredError = 0;

    % Loop untuk setiap pixel pada gambar
    for i = 1:M
        for j = 1:N
            % Hitung selisih intensitas pixel antara kedua gambar pada posisi pixel yang sama
            error = double(img1(i,j)) - double(img2(i,j));

            % Kuadratkan selisih
            squaredError = error^2;

            % Tambahkan ke total kesalahan kuadrat
            totalSquaredError = totalSquaredError + squaredError;
        end
    end

    % Hitung rata-rata dari kesalahan kuadrat
    mse = totalSquaredError / (M * N);
    
    % Hitung RMSE dari MSE
    rmse = sqrt(mse);
end
