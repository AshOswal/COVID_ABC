function R = getData(R)

switch R.data.source
    case 'simulated'
        load([R.root '\data\simulated_data\simdata.mat'])
        R.data.feat_emp{1} = xdata(R.obs.datachan,:);
        
    case 'CSSEGIS'
        datapath = [R.root '\data\CSSEGIS\'];
        R.data.srcCountry = 'China';
        
        % TimeScale
       Te = importCSSEGISTimeData([datapath 'Dead.csv']);
       Te_dt = mode(days(diff(table2array(Te(1,5:end)))));
       N = numel(table2array(Te(1,5:end)));
       t = [0:N-1].*Te_dt; % time vector (days)
        
        % Infected
        I = importCSSEGISdata([datapath 'Confirmed.csv']);
        I = I(strcmp(I.CountryRegion, R.data.srcCountry),5:end);
        I = sum(table2array(I),1);
        
        % Recovered
        Re = importCSSEGISdata([datapath 'Recovered.csv']);
        Re = Re(strcmp(Re.CountryRegion, R.data.srcCountry),5:end);
        Re = sum(table2array(Re),1);
        
        % Dead
        D = importCSSEGISdata([datapath 'Dead.csv']);
        D = D(strcmp(D.CountryRegion, R.data.srcCountry),5:end);
        D = sum(table2array(D),1);
        
        % Format for ABC
        xdata = nan(7,numel(t));
        xdata(3,:) = I;
        xdata(5,:) = Re;
        xdata(6,:) = D;
        R.data.feat_emp{1} = xdata;
        R.data.feat_xscale = t;
end

