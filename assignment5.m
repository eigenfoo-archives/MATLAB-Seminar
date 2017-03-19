%%  MATLAB Assignment 5
%   George Ho, 2/18/2017
%   This code imports the csv data using textscan, and processes it into
%   the required format using a for loop. It then clears the workspace of
%   everything but the required cell array of kickstart objects, in
%   preparation for saving the workspace as a .mat file.

fileID = fopen('most_backed.csv');
C_headers = textscan(fileID, '%s', 11, 'Delimiter', ',');
C_data = textscan(fileID, '%f %q %q %q %f %q %f %q %q %q %q', 'Delimiter', ',');
fclose(fileID);

kickstarts = cell(4000, 1);
for i = 1:4000
    kickstarts{i} = kickstarter();
    kickstarts{i}.amtpledged = C_data{1, 1}(i);
    kickstarts{i}.by = C_data{1, 2}{i};
    kickstarts{i}.category = C_data{1, 3}{i};
    kickstarts{i}.currency = C_data{1, 4}{i};
    kickstarts{i}.goal = C_data{1, 5}(i);
    loc = strsplit(C_data{1, 6}{i}, ', ');
    kickstarts{i}.City = loc{1};
    kickstarts{i}.State = loc{2};
    kickstarts{i}.numbackers = C_data{1, 7}(i);
    
    pledges = str2num(C_data{1, 9}{i});
    backs = str2num(C_data{1, 8}{i});
    cellarray = cell(length(pledges), 1);
    for j = 1:length(pledges)
        cellarray{j, 1} = struct('pledge', pledges(j), 'num_backers', backs(j));
    end
    kickstarts{i}.pledgetier = cellarray;
    
    kickstarts{i}.title = C_data{1, 10}{i};
    kickstarts{i}.url = C_data{1, 11}{i};
end

clear i j loc pledges backs cellarray C_data C_headers fileID