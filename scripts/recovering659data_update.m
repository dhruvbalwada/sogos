% making arrays of conductivity, temperature, and time data
myDir = cd('/Users/lily/Desktop/SG659_RC/eng/ct_all'); 
myDir = cd('/Users/lily/Desktop/SG659_RC/eng/ct_all'); 
myFiles = dir(fullfile(myDir,'*.eng'));

Traw = []; Craw = []; t = []; time = struct; corrdata = struct; 

for k = 100:100%length(myFiles)%1:length(myFiles)
%     if any(k == 156)
%         continue
%     end

%     nccreate('dive1.nc','T',...
%     'Dimensions', {'x',length(temp),'y',1},...
%     'FillValue','disable');

    baseFileName = myFiles(k).name;
    fullFileName = fullfile(myDir, baseFileName);
    CTdata = load(fullFileName);
    
    Traw = [Traw CTdata(:,3)'];
    Craw = [Craw CTdata(:,2)'];
    t = [t CTdata(:,1)'];
    time(k).time = CTdata(:,1)';
    
    corrdata(k).tempraw = CTdata(:,3);
    corrdata(k).saltraw = CTdata(:,2);
    corrdata(k).time = CTdata(:,1);
    
    fprintf(1, 'Finished with %s\n', fullFileName);
end

%%
% making array of depth data 
myDir = cd('/Users/lily/Desktop/SG659_RC/eng/depth_all'); 
myDir = cd('/Users/lily/Desktop/SG659_RC/eng/depth_all'); 
myFiles = dir(fullfile(myDir,'*.eng'));

P = []; p = struct;
% run CT loop first so interpolation of depth can happen
for k = 1:length(myFiles)%1:length(myFiles)
    baseFileName = myFiles(k).name;
    fullFileName = fullfile(myDir, baseFileName);
    Ddata = load(fullFileName);
    
    holder = interp1(Ddata(:,1),Ddata(:,2),time(k).time);
    P = [P holder];
    
    corrdata(k).press = holder;
    
    fprintf(1, 'Finished with %s\n', fullFileName);
end

%%
g = 4.41369871E-3;
h = 6.4506578E-4;
i = 2.70026551E-5;
j = 3.40227356E-6;
f0 = 1000;
T = 1./(g + (h.*(log(f0./Traw))) + (i.*(log(f0./Traw)).^2) + (j.*(log(f0./Traw)).^3)) - 273.15;

Craw_kHz = Craw./1000;
k = -9.92613612;
l = 1.08482545;
m = -2.91734417e-3;
n = 2.80269117E-4;
cpcor = -9.57E-8;
ctcor = 3.25E-6;
C = (k + l.*Craw_kHz.^2 + m.*Craw_kHz.^3 + n.*Craw_kHz.^4)./(10.*(1 + (ctcor.*T) + (cpcor.*P))); %S/m
% need to convert S/m to salinity
S = gsw_SP_from_C(C*10,T,P); % takes in mS/cm

%% for individual dive analysis

% g = 4.41369871E-3;
% h = 6.4506578E-4;
% i = 2.70026551E-5;
% j = 3.40227356E-6;
% f0 = 1000;
% for k = 1:length(corrdata)
% corrdata(k).temp = 1./(g + (h.*(log(f0./corrdata(k).tempraw))) + (i.*(log(f0./corrdata(k).tempraw)).^2) + (j.*(log(f0./corrdata(k).tempraw)).^3)) - 273.15;
% end
% % 
% % %Craw_kHz = Craw./1000;
% k = -9.92613612;
% l = 1.08482545;
% m = -2.91734417e-3;
% n = 2.80269117E-4;
% cpcor = -9.57E-8;
% ctcor = 3.25E-6;
% for f = 1:length(corrdata)
%     %for j = 1:length(corrdata(f).saltraw)
%     Craw_kHz = corrdata(f).saltraw./1000;
%     Cstore = (k + l.*Craw_kHz.^2 + m.*Craw_kHz.^3 + n.*Craw_kHz.^4)./(10.*(1 + (ctcor.*corrdata(f).temp) + (cpcor.*corrdata(f).press'))); %S/m
%     corrdata(f).salt = gsw_SP_from_C(Cstore*10,corrdata(f).temp,corrdata(f).press'); % takes in mS/cm
%     %end
% end %why doesn't this work?! nvm all good
% 
% %% getting O2 data
% myDir = cd('/Users/lily/Desktop/SG659_RC/eng/O2_all'); 
% myDir = cd('/Users/lily/Desktop/SG659_RC/eng/O2_all'); 
% myFiles = dir(fullfile(myDir,'*.eng'));
% 
% O2_time = []; O2 = []; O2_press = [];
% 
% for k = 1:length(myFiles)%1:length(myFiles)
% 
%     baseFileName = myFiles(k).name;
%     fullFileName = fullfile(myDir, baseFileName);
%     O2data = load(fullFileName);
%     
% %     O2_time = [O2_time O2data(:,1)'];
% %     O2 = [O2 O2data(:,2)'];
% %     
%     holder = interp1(corrdata(k).time,corrdata(k).press,O2data(:,1));
% %     O2_press = [O2_press holder];
%     
%     corrdata(k).O2press = holder;
%     
%     corrdata(k).O2time = O2data(:,1);
%     corrdata(k).O2 = O2data(:,2);
%     
%     fprintf(1, 'Finished with %s\n', fullFileName);
% end
%% getting WetLabs data? 
myDir = cd('/Users/lily/Desktop/SG659_RC/eng/wetlabs_all'); 
myDir = cd('/Users/lily/Desktop/SG659_RC/eng/wetlabs_all'); 
myFiles = dir(fullfile(myDir,'*.eng'));

WL_time = []; BS470 = []; BS700 = []; flu = [];

for k = 1:length(myFiles)%1:length(myFiles)

    baseFileName = myFiles(k).name;
    fullFileName = fullfile(myDir, baseFileName);
    WLdata = load(fullFileName);
    
    WL_time = [WL_time WLdata(:,1)'];
    BS470 = [BS470 WLdata(:,3)'];
    BS700 = [BS700 WLdata(:,5)'];
    flu = [flu WLdata(:,7)'];
    
    corrdata(k).WLtime = WLdata(:,1);
    corrdata(k).BS470 = WLdata(:,3);
    corrdata(k).BS700 = WLdata(:,5);
    corrdata(k).flu = WLdata(:,7);
    
    holder = interp1(corrdata(k).time,corrdata(k).press,WLdata(:,1));
    
    corrdata(k).WLpress = holder;
    
    fprintf(1, 'Finished with %s\n', fullFileName);
end







