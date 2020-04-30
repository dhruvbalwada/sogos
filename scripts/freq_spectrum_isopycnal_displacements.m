clear all
close all 

file = '/Users/dhruvbalwada/work_root/sogos/data/processed/isopycnal_displacement.nc'; 

%%

ncid = netcdf.open(file);

varid = netcdf.inqVarID(ncid,'iso');
iso = netcdf.getVar(ncid,varid);
varid = netcdf.inqVarID(ncid,'time');
time = netcdf.getVar(ncid,varid);

varid = netcdf.inqVarID(ncid,'isopycnal_displacement');
isopycnal_displacement = netcdf.getVar(ncid,varid);

%%

plot(time, isopycnal_displacement)

%%

len = size(isopycnal_displacement,1); 
psi = sleptap(len);

%%
[F, PS] = mspec(0.25, isopycnal_displacement, psi,'cyclic');

%% 
close all
figure,
loglog(F, PS, 'linewidth',1.5)
hold all
loglog(F, F.^-2, 'linewidth',1.5)
loglog(F, 0.1*F.^-3, 'linewidth',1.5)
legend('27.1', '27.3','27.4','27.45' , '-2', '-3')
set(gca,'fontsize',12)
xlabel('Frequency (1/hour)')
ylabel('PSD Isopycnal Displacement')
saveas(gcf, 'freq_spec.png')
%%
% close all
figure,
loglog(F, PS(:,1), 'linewidth',1.5)
hold all
loglog(F, 0.1*PS(:,2), 'linewidth',1.5)
loglog(F, 0.01*PS(:,3), 'linewidth',1.5)
loglog(F, 0.001*PS(:,4), 'linewidth',1.5)

loglog(1/12*[1  1] , [0.001, 1e6], 'color','k') 
loglog(1/15.2*[1  1] , [0.001, 1e6], '--' , 'color','k') 
loglog(1/24*[1  1] , [0.001, 1e6], 'color','k') 
loglog(1/48*[1  1] , [0.001, 1e6], 'color','k') 
loglog(1/2*[1  1] , [0.001, 1e6], '.-', 'color','k') 
%legend([num2str(iso)])
    %, 'Semi-diurnal', 'Inertial', 'Diurnal', '48 Hour','2 Hours'])
set(gca,'fontsize',12)
xlabel('Frequency (1/hour)')
ylabel('PSD Isopycnal Displacement')
saveas(gcf, 'freq_spec_spread.png')

%% 

close all
figure,
loglog(F, PS, 'linewidth',1.5)
hold all
%loglog(F, F.^-2, 'linewidth',1.5)
loglog(F, 1e-25*F.^-12, 'linewidth',1.5)
loglog(F, 500000000*exp(-F.^2*1000000),'--', 'linewidth', 3)
%loglog(F, 500000000*exp(-F.^2*1000000),'--', 'linewidth', 3)
%legend('27.1', '27.3','27.4','27.45' , '-2', '-3')
%set(gca,'fontsize',12)
ylim([10^-2 10^9])
xlim([0.0005  1])
xlabel('Frequency (1/hour)')
ylabel('PSD Isopycnal Displacement')
set(gca,'fontsize',12)
saveas(gcf, 'freq_spec_gauss_fit.png')