% Calculate N2 (using both vertical derivative of b and gsw command)
%dz = 5;
%N2 = (buoy_wslope_grid(1:end-2,:)-buoy_wslope_grid(3:end,:))/2/dz;
%[N2_gsw,pres_mid_wslope] = gsw_Nsquared(Sgrid_5m,Tgrid_5m,z);
[N2_gsw,pres_mids] = gsw_Nsquared(Sgrid_5m,Tgrid_5m,z');

buoyancy = 9.8.*(1-((1000+Rhogrid_5m)/1025));
dz = 5;
buoy_sort = NaN*ones(size(buoyancy));
for i=1:1014
    kk = find(~isnan(buoyancy(:,i)));
    buoy_sort(1:length(kk),i) = sort(buoyancy(kk,i),'descend');
end
N2_sort = (buoy_sort(1:end-2,:)-buoy_sort(3:end,:))/2/dz;

% imagesc(log10(N2_sort))
% set(gca,'YDir','normal')

N2_smoothsort = NaN*ones(size(N2_sort)); N2_smoothsort10 = NaN*ones(size(N2_sort));
for i=1:1014
    kk = find(~isnan(N2_sort(:,i)));
    N2_smoothsort(kk,i) = smooth(N2_sort(kk,i),5);
    N2_smoothsort10(kk,i) = smooth(N2_sort(kk,i),10);
end

imagesc(start_time,mids,log10(N2_smoothsort))
%caxis([nanmean(nanmean(N2_smoothsort))-5*nanstd(nanstd(N2_smoothsort)) nanmean(nanmean(N2_smoothsort))+5*nanstd(nanstd(N2_smoothsort))])


% % Calculate the geostrophic shear
% %strf_wslope =
% gsw_geo_strf_dyn_height(SA_wslope,CT_wslope,pres_wslope,0);
% %[u_geo,lat_mid_wslope,lon_mid_wslope] =
% gsw_geostrophic_velocity(strf_wslope,lon_wslope,lat_wslope,pres_wslope);
% 
% % Calculate the geostrophic shear from the seawater toolbox
% gpan = sw_gpan(ctd_salt_1(:,3:11),ctd_temp_1(:,3:11),ctd_pres(:,3:11));
% gvel = sw_gvel(gpan,lat_wslope,lon_wslope);

%%
%[N2_gsw,pres_mids] = gsw_Nsquared(gridded660.salt,gridded660.temp,gridded660.press_int');

buoyancy = 9.8.*(1-((1000+gridded660.density)/1025));
dz = 10;
buoy_sort = NaN*ones(size(buoyancy));
for i=1:length(buoyancy)
    kk = find(~isnan(buoyancy(:,i)));
    buoy_sort(1:length(kk),i) = sort(buoyancy(kk,i),'descend');
end
N2_sort = (buoy_sort(1:end-2,:)-buoy_sort(3:end,:))/2/dz;

% imagesc(log10(N2_sort))
% set(gca,'YDir','normal')

N2_smoothsort660 = NaN*ones(size(N2_sort)); N2_smoothsort10660 = NaN*ones(size(N2_sort));
for i=1:length(buoyancy)
    kk = find(~isnan(N2_sort(:,i)));
    N2_smoothsort660(kk,i) = smooth(N2_sort(kk,i),2);
    N2_smoothsort10660(kk,i) = smooth(N2_sort(kk,i),10);
end

figure;
pcolor(gridded660.time_int,gridded660.press_int(2:end-1),log10(N2_smoothsort660))
shading flat
set(gca,'ydir','reverse')
colormap(cmocean('balance'))
caxis([-6.5 -3.5])
%%
buoyancy = 9.8.*(1-((1000+gridded659.density)/1025));
dz = 5;
buoy_sort = NaN*ones(size(buoyancy));
for i=1:length(buoyancy)
    kk = find(~isnan(buoyancy(:,i)));
    buoy_sort(1:length(kk),i) = sort(buoyancy(kk,i),'descend');
end
N2_sort = (buoy_sort(1:end-2,:)-buoy_sort(3:end,:))/2/dz;

% imagesc(log10(N2_sort))
% set(gca,'YDir','normal')

N2_smoothsort659 = NaN*ones(size(N2_sort)); N2_smoothsort10 = NaN*ones(size(N2_sort));
for i=1:length(buoyancy)
    kk = find(~isnan(N2_sort(:,i)));
    N2_smoothsort659(kk,i) = smooth(N2_sort(kk,i),5);
    N2_smoothsort10659(kk,i) = smooth(N2_sort(kk,i),10);
end
