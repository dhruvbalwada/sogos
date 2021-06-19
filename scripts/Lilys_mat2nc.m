%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Convert mat files to a netcdf format that is easy to digest in python.
%%% One of the main decisions is how to connect different dive data
%%% together? We will take the approach of GliderTools to combine all
%%% the dives into a single long array, and introduce a variable called
%%% 'dives'. Dives has a number for dive, eg: 1.0 is first down dive and
%%% 1.5 is first up dive.
%%%
%%% Dhruv Balwada, 22 April 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Issues with the matlab files (23 April 2020)
%%% - Missing depth data
%%% - Lat/lon have been made by interpolation (maybe should be using the
%%%  locations from the flight models)
%%% - variable names are different between two files
%%% - structure form is not amenable to creating netcdf files
%%% - Meta data/attribute missing for all files
%%% - Other variables need to be added
%%% - Interpolation routines for 659 are not the same as 660

clear all
close all

glidnum = 659;

if glidnum == 659
    data_659 = '/Users/dhruvbalwada/OneDrive/sogos_data/data/interim/gliders/sg659_20201010/sg659_dives_20201010.mat';
    load(data_659);
    glid_data = data659_20201010;

else
    data_660 = '/Users/dhruvbalwada/OneDrive/sogos_data/data/interim/gliders/sg660_20201010/sg660_dives_20201010.mat';
    load(data_660);
    glid_data = data660_20201010;
end


%% a trial plot
%n=10;
%close all
%plot(glid_data(n).time, glid_data(n).press)

%% Convert to data arrays
ndives = length(glid_data);

% Since different sensors measure at different times, we need to make
% different sets.

% CTD Variables
lonarray = []; latarray = [];
temparray = []; saltarray = []; pressarray = [];
timearray = []; dives = [];

% O2 Variables
O2array = []; O2array_time = []; O2array_press = [];

% Chl Variables
chlarray = []; chlarray_time = []; chlarray_press = [];

% bbp Variables
bbp470array = []; bbp700array = []; bbparray_time = []; bbparray_press = [];

%
% the current data sets have different variable names and also different
% forms, one of the row vectors and the other column vectors
if glidnum==659
    for i = 1:ndives
        % CTD variables
        lonarray = [lonarray; glid_data(i).lon'];
        latarray = [latarray; glid_data(i).lat'];
        pressarray = [pressarray; glid_data(i).press'];
        temparray = [temparray; glid_data(i).temp'];
        saltarray = [saltarray; glid_data(i).salt'];
        timearray = [timearray; glid_data(i).time'];

        % dive numbers (updive is shifted by 0.5)
        dives_local = i*ones(length(glid_data(i).lon),1);
        id = find(glid_data(i).press == nanmax(glid_data(i).press));
        dives_local(id+1:end) = dives_local(id+1:end)+0.5;
        dives = [dives; dives_local];

        % O2 Variables
        O2array = [O2array; glid_data(i).O2'];
        O2array_time = [O2array_time; glid_data(i).O2time'];
        O2array_press = [O2array_press; glid_data(i).O2press'];

        % Chl Variables
        chlarray = [chlarray; glid_data(i).Chl'];
        chlarray_time = [chlarray_time; glid_data(i).timeChl'];
        chlarray_press = [chlarray_press; glid_data(i).pressChl'];

        % bbp Variables
        bbp700array = [bbp700array; glid_data(i).bbp700'];
        bbp470array = [bbp470array; glid_data(i).bbp470'];
        bbparray_time = [bbparray_time; glid_data(i).timebbp'];
        bbparray_press = [bbparray_press; glid_data(i).pressbbp'];
    end
elseif glidnum==660
    for i = 1:ndives
        % CTD variables
        lonarray = [lonarray; glid_data(i).longitude];
        latarray = [latarray; glid_data(i).latitude];
        pressarray = [pressarray; glid_data(i).pressure];
        temparray = [temparray; glid_data(i).temperature];
        saltarray = [saltarray; glid_data(i).salinity];
        timearray = [timearray; glid_data(i).time];

        % dive numbers (updive is shifted by 0.5)
        dives_local = i*ones(length(glid_data(i).longitude),1);
        id = find(glid_data(i).pressure == nanmax(glid_data(i).pressure));
        dives_local(id+1:end) = dives_local(id+1:end)+0.5;
        dives = [dives; dives_local];

        % O2 Variables
        O2array = [O2array; glid_data(i).oxygen];
        O2array_time = [O2array_time; glid_data(i).oxygen_time];
        O2array_press = [O2array_press; glid_data(i).oxygen_pressure];

        % Chl Variables
        chlarray = [chlarray; glid_data(i).Chl];
        chlarray_time = [chlarray_time; glid_data(i).timeChl];
        chlarray_press = [chlarray_press; glid_data(i).pressChl];

        % bbp Variables
        bbp700array = [bbp700array; glid_data(i).bbp700];
        bbp470array = [bbp470array; glid_data(i).bbp470];
        bbparray_time = [bbparray_time; glid_data(i).timebbp];
        bbparray_press = [bbparray_press; glid_data(i).pressbbp];
    end
end

%% Save to netcdf data

% CTD data
% Define netcdf file container
num_ctdpts = length(saltarray);
ncid_ctd = netcdf.create(['CTD_' num2str(glidnum) '.nc'],'NC_WRITE');

% Only one dimension, which is the data point
dimid_ctdpts = netcdf.defDim(ncid_ctd, 'ctd_data_point', num_ctdpts);

varid_press = netcdf.defVar(ncid_ctd,'pressure','NC_DOUBLE',[dimid_ctdpts]);
varid_lat   = netcdf.defVar(ncid_ctd,'latitude','NC_DOUBLE',[dimid_ctdpts]);
varid_lon   = netcdf.defVar(ncid_ctd,'longitude','NC_DOUBLE',[dimid_ctdpts]);
varid_temp = netcdf.defVar(ncid_ctd,'temperature','NC_DOUBLE',[dimid_ctdpts]);
varid_salt = netcdf.defVar(ncid_ctd,'salinity','NC_DOUBLE',[dimid_ctdpts]);
varid_dives = netcdf.defVar(ncid_ctd,'dives','NC_DOUBLE',[dimid_ctdpts]);
varid_time = netcdf.defVar(ncid_ctd,'time','NC_DOUBLE',[dimid_ctdpts]);

netcdf.endDef(ncid_ctd);

% Put Data
netcdf.putVar(ncid_ctd,varid_press,pressarray);
netcdf.putVar(ncid_ctd,varid_lat,latarray);
netcdf.putVar(ncid_ctd,varid_lon,lonarray);
netcdf.putVar(ncid_ctd,varid_temp,temparray);
netcdf.putVar(ncid_ctd,varid_salt,saltarray);
netcdf.putVar(ncid_ctd,varid_dives,dives);
% convert time back to GMT time epoch since 1970 format
netcdf.putVar(ncid_ctd,varid_time,(timearray - datenum('1970-01-01'))*24*3600);


% Write Attributes
netcdf.reDef(ncid_ctd); % we need to reenter definition mode to write atts
netcdf.putAtt(ncid_ctd, varid_press, 'units', 'dbar')
netcdf.putAtt(ncid_ctd, varid_press, 'standard_name', 'Pressure')
netcdf.putAtt(ncid_ctd, varid_lat, 'units', 'degrees north')
netcdf.putAtt(ncid_ctd, varid_lat, 'standard_name', 'Latitude')
netcdf.putAtt(ncid_ctd, varid_lon, 'units', 'degrees east')
netcdf.putAtt(ncid_ctd, varid_lon, 'standard_name', 'Longitude')
netcdf.putAtt(ncid_ctd, varid_temp, 'units', 'Celsius')
netcdf.putAtt(ncid_ctd, varid_temp, 'standard_name', 'Conservative Temperature')
netcdf.putAtt(ncid_ctd, varid_salt, 'units', 'g/kg')
netcdf.putAtt(ncid_ctd, varid_salt, 'standard_name', 'Absolute Salinity')
netcdf.putAtt(ncid_ctd, varid_dives, 'units', 'NA')
netcdf.putAtt(ncid_ctd, varid_dives, 'standard_name', 'Dive Number')
netcdf.putAtt(ncid_ctd, varid_time, 'units', 'seconds since 1970-01-01')
netcdf.putAtt(ncid_ctd, varid_time, 'standard_name', 'Time')

netcdf.close(ncid_ctd);


%% O2 data
% Define netcdf file container
num_O2pts = length(O2array_time);
ncid_O2 = netcdf.create(['O2_' num2str(glidnum) '.nc'],'NC_WRITE');

% Only one dimension, which is the data point
dimid_O2pts = netcdf.defDim(ncid_O2, 'O2_data_point', num_O2pts);

varid_press = netcdf.defVar(ncid_O2,'pressure','NC_DOUBLE',[dimid_O2pts]);
varid_O2   = netcdf.defVar(ncid_O2,'oxygen','NC_DOUBLE',[dimid_O2pts]);
varid_time = netcdf.defVar(ncid_O2,'time','NC_DOUBLE',[dimid_O2pts]);

netcdf.endDef(ncid_O2);

% Put Data
netcdf.putVar(ncid_O2,varid_press,O2array_press);
netcdf.putVar(ncid_O2,varid_O2,O2array);
netcdf.putVar(ncid_O2,varid_time,(O2array_time - datenum('1970-01-01'))*24*3600);

% Write Attributes
netcdf.reDef(ncid_O2); % we need to reenter definition mode to write atts
netcdf.putAtt(ncid_O2, varid_press, 'units', 'dbar')
netcdf.putAtt(ncid_O2, varid_press, 'standard_name', 'Pressure')
netcdf.putAtt(ncid_O2, varid_O2, 'units', 'micromoles/kg')
netcdf.putAtt(ncid_O2, varid_O2, 'standard_name', 'Dissolved Oxygen')
netcdf.putAtt(ncid_O2, varid_time, 'units', 'seconds since 1970-01-01')
netcdf.putAtt(ncid_O2, varid_time, 'standard_name', 'Time')

netcdf.close(ncid_O2);

%% Chl data
% Define netcdf file container
num_chlpts = length(chlarray);
ncid_chl = netcdf.create(['Chl_' num2str(glidnum) '.nc'],'NC_WRITE');

% Only one dimension, which is the data point
dimid_chlpts = netcdf.defDim(ncid_chl, 'Chl_data_point', num_chlpts);

varid_press = netcdf.defVar(ncid_chl,'pressure','NC_DOUBLE',[dimid_chlpts]);
varid_chl   = netcdf.defVar(ncid_chl,'Chl','NC_DOUBLE',[dimid_chlpts]);
varid_time = netcdf.defVar(ncid_chl,'time','NC_DOUBLE',[dimid_chlpts]);

netcdf.endDef(ncid_chl);

% Put Data
netcdf.putVar(ncid_chl,varid_press,chlarray_press);
netcdf.putVar(ncid_chl,varid_chl,chlarray);
netcdf.putVar(ncid_chl,varid_time,(chlarray_time - datenum('1970-01-01'))*24*3600);

% Write Attributes
netcdf.reDef(ncid_chl); % we need to reenter definition mode to write atts
netcdf.putAtt(ncid_chl, varid_press, 'units', 'dbar')
netcdf.putAtt(ncid_chl, varid_press, 'standard_name', 'Pressure')
netcdf.putAtt(ncid_chl, varid_chl, 'units', 'mg/m^3')
netcdf.putAtt(ncid_chl, varid_chl, 'standard_name', 'Dissolved Chlorophyll')
netcdf.putAtt(ncid_chl, varid_time, 'units', 'seconds since 1970-01-01')
netcdf.putAtt(ncid_chl, varid_time, 'standard_name', 'Time')

netcdf.close(ncid_chl);
%% Backscatter data
% Define netcdf file container
num_bbppts = length(bbp470array);
ncid_bbp = netcdf.create(['BBP_' num2str(glidnum) '.nc'],'NC_WRITE');

% Only one dimension, which is the data point
dimid_bbppts = netcdf.defDim(ncid_bbp, 'bbp_data_point', num_bbppts);

varid_press = netcdf.defVar(ncid_bbp,'pressure','NC_DOUBLE',[dimid_bbppts]);
varid_bbp470 = netcdf.defVar(ncid_bbp,'bbp470','NC_DOUBLE',[dimid_bbppts]);
varid_bbp700 = netcdf.defVar(ncid_bbp,'bbp700','NC_DOUBLE',[dimid_bbppts]);
varid_time = netcdf.defVar(ncid_bbp,'time','NC_DOUBLE',[dimid_bbppts]);

netcdf.endDef(ncid_bbp);

% Put Data
netcdf.putVar(ncid_bbp,varid_press,bbparray_press);
netcdf.putVar(ncid_bbp,varid_bbp470,bbp470array);
netcdf.putVar(ncid_bbp,varid_bbp700,bbp700array);
netcdf.putVar(ncid_bbp,varid_time,(bbparray_time - datenum('1970-01-01'))*24*3600);

% Write Attributes
netcdf.reDef(ncid_bbp); % we need to reenter definition mode to write atts
netcdf.putAtt(ncid_bbp, varid_press, 'units', 'dbar')
netcdf.putAtt(ncid_bbp, varid_press, 'standard_name', 'Pressure')
netcdf.putAtt(ncid_bbp, varid_bbp470, 'units', '1/m')
netcdf.putAtt(ncid_bbp, varid_bbp470, 'standard_name', 'Backscatter 470nm')
netcdf.putAtt(ncid_bbp, varid_bbp700, 'units', '1/m')
netcdf.putAtt(ncid_bbp, varid_bbp700, 'standard_name', 'Backscatter 700nm')
netcdf.putAtt(ncid_bbp, varid_time, 'units', 'seconds since 1970-01-01')
netcdf.putAtt(ncid_bbp, varid_time, 'standard_name', 'Time')

netcdf.close(ncid_bbp);
