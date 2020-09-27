training_files_C = dir('C:\DSP\part 2\train\C\*.wav');
training_files_D = dir('C:\DSP\part 2\train\D\*.wav');
training_files_3 = dir('C:\DSP\part 2\train\3\*.wav');
training_files_4 = dir('C:\DSP\part 2\train\4\*.wav');
%=============================================%
testing_files_C = dir('C:\DSP\part 2\test\C\*.wav');
testing_files_D = dir('C:\DSP\part 2\test\D\*.wav');
testing_files_3 = dir('C:\DSP\part 2\test\3\*.wav');
testing_files_4 = dir('C:\DSP\part 2\test\4\*.wav');

% read the 'C' training files and calculate the energy of them.
data_C = [];
for i = 1:length(training_files_C)
file_path = strcat(training_files_C(i).folder,'\',training_files_C(i).name);
[y,fs] = audioread(file_path);
%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_C1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_C2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_C3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);
ZCR_C = [ZCR_C1 ZCR_C2 ZCR_C3 energy];
data_C = [data_C ;ZCR_C];
end
ZCR_C=mean(data_C);
fprintf('The ZCR of C is \n');
disp(ZCR_C);

% read the 'D' training files and calculate the energy of them.
data_D = [];
for i = 1:length(training_files_D)
file_path = strcat(training_files_D(i).folder,'\',training_files_D(i).name);
[y,fs] = audioread(file_path);

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_D1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_D2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_D3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

ZCR_D = [ZCR_D1 ZCR_D2 ZCR_D3 energy];

data_D = [data_D ;ZCR_D];
end
ZCR_D=mean(data_D);
fprintf('The ZCR of D is \n');
disp(ZCR_D);

% read the '3' training files and calculate the energy of them.
data_3 = [];
for i = 1:length(training_files_3)
file_path = strcat(training_files_3(i).folder,'\',training_files_3(i).name);
[y,fs] = audioread(file_path);

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_31 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_32 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_33 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

ZCR_3 = [ZCR_31 ZCR_32 ZCR_33 energy];

data_3 = [data_3 ;ZCR_3];
end

ZCR_3=mean(data_3);
fprintf('The ZCR of 3 is \n');
disp(ZCR_3);

% read the '4' training files and calculate the energy of them.
data_4 = [];
for i = 1:length(training_files_4)
file_path = strcat(training_files_4(i).folder,'\',training_files_4(i).name);
[y,fs] = audioread(file_path);

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_41 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_42 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_43 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

ZCR_4 = [ZCR_41 ZCR_42 ZCR_43 energy];

data_4 = [data_4 ;ZCR_4];
end
ZCR_4=mean(data_4);
fprintf('The ZCR of 4 is \n');
disp(ZCR_4);


% read the 'C' tesing files and calculate the energy of them.

for i = 1:length(testing_files_C)
file_path = strcat(testing_files_C(i).folder,'\',testing_files_C(i).name);
[y,fs] = audioread(file_path);

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_C1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_C2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_C3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

y_ZCR = [ZCR_C1 ZCR_C2 ZCR_C3 energy];
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_D],'cosine')&&pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&&pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_4],'cosine'))
        fprintf('Test file [C] #%d classified as C \n',i);
    end
    if(pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&&pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_4],'cosine')&&pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_C],'cosine'))
        fprintf('Test file [C] #%d classified as D \n',i);
    end
    if(pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&& pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_C],'cosine')&&pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_D],'cosine'))
        fprintf('Test file [C] #%d classified as 4 \n',i);
    end
      if(pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_4],'cosine')&& pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_C],'cosine')&& pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_D],'cosine'))
        fprintf('Test file [C] #%d classified as 3 \n',i);
     end
end

% read the 'D' tesing files and calculate the energy of them.
for i = 1:length(testing_files_D)
file_path = strcat(testing_files_D(i).folder,'\',testing_files_D(i).name);
[y,fs] = audioread(file_path);
%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_D1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_D2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_D3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
energy = sum(y.^2);

y_ZCR = [ZCR_D1 ZCR_D2 ZCR_D3 energy];
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&&pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_4],'cosine')&&pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_C],'cosine'))
        fprintf('Test file [D] #%d classified as D \n',i);
    end
    if(pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_D],'cosine')&&pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&&pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_4],'cosine'))
        fprintf('Test file [D] #%d classified as C \n',i);
    end
    if(pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&& pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_C],'cosine')&&pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_D],'cosine'))
        fprintf('Test file [D] #%d classified as 4 \n',i);
    end
      if(pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_4],'cosine')&& pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_C],'cosine')&& pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_D],'cosine'))
        fprintf('Test file [D] #%d classified as 3 \n',i);
     end
end



% read the '3' tesing files and calculate the energy of them.

for i = 1:length(testing_files_3)
file_path = strcat(testing_files_3(i).folder,'\',testing_files_3(i).name);
[y,fs] = audioread(file_path);

%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_31 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_32 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_33 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
%calculate the energy
energy = sum(y.^2);

y_ZCR = [ZCR_31 ZCR_32 ZCR_33 energy];
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_4],'cosine')&& pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_C],'cosine')&& pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_D],'cosine'))
        fprintf('Test file [3] #%d classified as 3 \n',i);
     end
     if(pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_D],'cosine')&&pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&&pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_4],'cosine'))
        fprintf('Test file [3] #%d classified as C \n',i);
    end
    if(pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&&pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_4],'cosine')&&pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_C],'cosine'))
        fprintf('Test file [3] #%d classified as D \n',i);
    end
    if(pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&& pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_C],'cosine')&&pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_D],'cosine'))
        fprintf('Test file [3] #%d classified as 4 \n',i);
    end
    
end

% read the '4' tesing files and calculate the energy of them.
for i = 1:length(testing_files_4)
file_path = strcat(testing_files_4(i).folder,'\',testing_files_4(i).name);
[y,fs] = audioread(file_path);
%divide the signal into 3 parts and calculate the ZCR for each part
ZCR_D1 = mean(abs(diff(sign(y(1:floor(end/3))))))./2;
ZCR_D2 = mean(abs(diff(sign(y(floor(end/3):floor (end*2/3))))))./2;
ZCR_D3 = mean(abs(diff(sign(y(floor(end*2/3):end)))))./2;
energy = sum(y.^2);

y_ZCR = [ZCR_41 ZCR_42 ZCR_43 energy];
    %make the decision based on cosine distance
    if(pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&& pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_C],'cosine')&&pdist([y_ZCR;ZCR_4],'cosine') < pdist([y_ZCR;ZCR_D],'cosine'))
        fprintf('Test file [4] #%d classified as 4 \n',i);
    end
    if(pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_D],'cosine')&&pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&&pdist([y_ZCR;ZCR_C],'cosine') < pdist([y_ZCR;ZCR_4],'cosine'))
        fprintf('Test file [4] #%d classified as C \n',i);
    end
   if(pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_3],'cosine')&&pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_4],'cosine')&&pdist([y_ZCR;ZCR_D],'cosine') < pdist([y_ZCR;ZCR_C],'cosine'))
        fprintf('Test file [4] #%d classified as D \n',i);
    end
      if(pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_4],'cosine')&& pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_C],'cosine')&& pdist([y_ZCR;ZCR_3],'cosine') < pdist([y_ZCR;ZCR_D],'cosine'))
        fprintf('Test file [4] #%d classified as 3 \n',i);
     end
end