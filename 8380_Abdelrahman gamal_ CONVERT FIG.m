files = dir('*.fig');

for i=1:length(files)

   filename = files(i).name;

   fig = openfig(filename, 'new', 'invisible');
   target_name=filename(1:end-4);
   uiopen(filename,1);

   saveas(fig,target_name,'png');

   close;

end
