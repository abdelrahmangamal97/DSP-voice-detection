training_files_C = dir('C:\DSP\part 2\train\C\*.wav');
training_files_D = dir('C:\DSP\part 2\train\D\*.wav');
training_files_3 = dir('C:\DSP\part 2\train\3\*.wav');
training_files_4 = dir('C:\DSP\part 2\train\4\*.wav');
%=============================================%
testing_files_C = dir('C:\DSP\part 2\test\C\*.wav');
testing_files_D = dir('C:\DSP\part 2\test\D\*.wav');
testing_files_3 = dir('C:\DSP\part 2\test\3\*.wav');
testing_files_4 = dir('C:\DSP\part 2\test\4\*.wav');


% ------------ Training -----------------------------
% read the '3' training files and calculate the energy of them.
data_3 = [];
for i = 1:length(training_files_3)
f_path = strcat(training_files_3(i).folder,'\',training_files_3(i).name);% get the file path with name
[y,fs] = audioread(f_path); % read the audio file

energy_3=sum(y.^2); % calculate the energy
data_3 = [data_3 energy_3]; % append the energy with all other energies of the other files
end
energy_3=mean(data_3); % calculate the average energy
fprintf('The energy of 3 is \n');
disp(energy_3);

% read the '4' training files and calculate the energy of them.
data_4 = [];
for i = 1:length(training_files_4)
f_path = strcat(training_files_4(i).folder,'\',training_files_4(i).name);
[y,fs] = audioread(f_path);

energy_4=sum(y .^2);
data_4 = [data_4 energy_4];
end
energy_4=mean(data_4);
fprintf('The energy of 4 is \n');
disp(energy_4);

% read the 'C' training files and calculate the energy of them.
data_C = [];
for i = 1:length(training_files_C)
f_path = strcat(training_files_C(i).folder,'\',training_files_C(i).name);% get the file path with name
[y,fs] = audioread(f_path); % read the audio file

energy_C=sum(y.^2); % calculate the energy
data_C = [data_C energy_C]; % append the energy with all other energies of the other files
end
energy_C=mean(data_C); % calculate the average energy
fprintf('The energy of C is \n');
disp(energy_C);

% read the 'D' training files and calculate the energy of them.
data_D = [];
for i = 1:length(training_files_D)
f_path = strcat(training_files_D(i).folder,'\',training_files_D(i).name);
[y,fs] = audioread(f_path);

energy_D=sum(y .^2);
data_D = [data_D energy_D];
end
energy_D=mean(data_D);
fprintf('The energy of D is \n');
disp(energy_D);

% ------------ Evaluation -----------------------------

% read the '3' tesing files and calculate the energy of them.

for i = 1:length(testing_files_3)
f_path = strcat(testing_files_3(i).folder,'\',testing_files_3(i).name);
[y,fs] = audioread(f_path);

y_energy  = sum(y.^2);
 % test if the energy of this file is closer to 3 or 4 average energies
  if( abs(y_energy-energy_3) < abs(y_energy-energy_C) && abs(y_energy-energy_3) < abs(y_energy-energy_4) && abs(y_energy-energy_3) < abs(y_energy-energy_D) ) 
    fprintf('Test file [3] #%d classified as 3 E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_4) < abs(y_energy-energy_C) && abs(y_energy-energy_4) < abs(y_energy-energy_D) && abs(y_energy-energy_4) < abs(y_energy-energy_3) ) 
   fprintf('Test file [3] #%d classified as 4 E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_C) < abs(y_energy-energy_3) && abs(y_energy-energy_C) < abs(y_energy-energy_4) && abs(y_energy-energy_C) < abs(y_energy-energy_D) ) 
   fprintf('Test file [3] #%d classified as C E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_D) < abs(y_energy-energy_C) && abs(y_energy-energy_D) < abs(y_energy-energy_4) && abs(y_energy-energy_D) < abs(y_energy-energy_3) ) 
    fprintf('Test file [3] #%d classified as D E=%d\n',i,y_energy);
   end
end

for i = 1:length(testing_files_4)
f_path = strcat(testing_files_4(i).folder,'\',testing_files_4(i).name);
[y,fs] = audioread(f_path);

y_energy  = sum(y.^2);

    if( abs(y_energy-energy_3) < abs(y_energy-energy_C) && abs(y_energy-energy_3) < abs(y_energy-energy_4) && abs(y_energy-energy_3) < abs(y_energy-energy_D) ) 
    fprintf('Test file [4] #%d classified as 3 E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_4) < abs(y_energy-energy_C) && abs(y_energy-energy_4) < abs(y_energy-energy_D) && abs(y_energy-energy_4) < abs(y_energy-energy_3) ) 
   fprintf('Test file [4] #%d classified as 4 E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_C) < abs(y_energy-energy_3) && abs(y_energy-energy_C) < abs(y_energy-energy_4) && abs(y_energy-energy_C) < abs(y_energy-energy_D) ) 
   fprintf('Test file [4] #%d classified as C E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_D) < abs(y_energy-energy_C) && abs(y_energy-energy_D) < abs(y_energy-energy_4) && abs(y_energy-energy_D) < abs(y_energy-energy_3) ) 
    fprintf('Test file [4] #%d classified as D E=%d\n',i,y_energy);
   end
end
for i = 1:length(testing_files_C)
f_path = strcat(testing_files_C(i).folder,'\',testing_files_C(i).name);
[y,fs] = audioread(f_path);

y_energy  = sum(y.^2);

    if( abs(y_energy-energy_3) < abs(y_energy-energy_C) && abs(y_energy-energy_3) < abs(y_energy-energy_4) && abs(y_energy-energy_3) < abs(y_energy-energy_D) ) 
    fprintf('Test file [C] #%d classified as 3 E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_4) < abs(y_energy-energy_C) && abs(y_energy-energy_4) < abs(y_energy-energy_D) && abs(y_energy-energy_4) < abs(y_energy-energy_3) ) 
   fprintf('Test file [C] #%d classified as 4 E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_C) < abs(y_energy-energy_3) && abs(y_energy-energy_C) < abs(y_energy-energy_4) && abs(y_energy-energy_C) < abs(y_energy-energy_D) ) 
   fprintf('Test file [C] #%d classified as C E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_D) < abs(y_energy-energy_C) && abs(y_energy-energy_D) < abs(y_energy-energy_4) && abs(y_energy-energy_D) < abs(y_energy-energy_3) ) 
    fprintf('Test file [C] #%d classified as D E=%d\n',i,y_energy);
   end
end
for i = 1:length(testing_files_D)
f_path = strcat(testing_files_D(i).folder,'\',testing_files_D(i).name);
[y,fs] = audioread(f_path);

y_energy  = sum(y.^2);

    if( abs(y_energy-energy_3) < abs(y_energy-energy_C) && abs(y_energy-energy_3) < abs(y_energy-energy_4) && abs(y_energy-energy_3) < abs(y_energy-energy_D) ) 
    fprintf('Test file [D] #%d classified as 3 E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_4) < abs(y_energy-energy_C) && abs(y_energy-energy_4) < abs(y_energy-energy_D) && abs(y_energy-energy_4) < abs(y_energy-energy_3) ) 
   fprintf('Test file [D] #%d classified as 4 E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_C) < abs(y_energy-energy_3) && abs(y_energy-energy_C) < abs(y_energy-energy_4) && abs(y_energy-energy_C) < abs(y_energy-energy_D) ) 
   fprintf('Test file [D] #%d classified as C E=%d\n',i,y_energy);
  end
  if( abs(y_energy-energy_D) < abs(y_energy-energy_C) && abs(y_energy-energy_D) < abs(y_energy-energy_4) && abs(y_energy-energy_D) < abs(y_energy-energy_3) ) 
    fprintf('Test file [D] #%d classified as D E=%d\n',i,y_energy);
   end
end
