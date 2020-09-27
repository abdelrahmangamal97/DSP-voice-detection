energy_3= 1989.7 ;
energy_4 =2242.3;
energy_C= 2167.2;
energy_D= 2636.4;
recObj = audiorecorder(44000, 24, 1);% record at Fs=44khz, 24 bits per sample

data_y = [];
fprintf('you will say same number 5 times\n\n')

for i = 1:5
  
fprintf('Start speaking for audio #%d \n',i)
recordblocking(recObj, 2); % record 2 seconds
fprintf('Audio #%d has ended\n' ,i)
y = getaudiodata(recObj);
y_energy=sum(y .^2);
data_y = [data_y y_energy];
end
figure(1);plot(y);
play(recObj);
 if( abs(y_energy-energy_3) < abs(y_energy-energy_C) && abs(y_energy-energy_3) < abs(y_energy-energy_4) && abs(y_energy-energy_3) < abs(y_energy-energy_D) ) 
    fprintf('Test file audio  classified as 3 E=%d\n',y_energy);
 end
  
  if( abs(y_energy-energy_4) < abs(y_energy-energy_C) && abs(y_energy-energy_4) < abs(y_energy-energy_D) && abs(y_energy-energy_4) < abs(y_energy-energy_3) ) 
   fprintf('Test audio classified as 4 E=%d\n',y_energy);
  end
  
  if( abs(y_energy-energy_C) < abs(y_energy-energy_3) && abs(y_energy-energy_C) < abs(y_energy-energy_4) && abs(y_energy-energy_C) < abs(y_energy-energy_D) ) 
   fprintf('Test file audio  classified as C E=%d\n',y_energy);
  end
  
  if( abs(y_energy-energy_D) < abs(y_energy-energy_C) && abs(y_energy-energy_D) < abs(y_energy-energy_4) && abs(y_energy-energy_D) < abs(y_energy-energy_3) ) 
    fprintf('Test file audio  classified as D E=%d\n',y_energy);
  end