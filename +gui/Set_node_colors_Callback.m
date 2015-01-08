function Set_node_colors_Callback(obj, ~)

[colors_filename, colors_pathname] = uigetfile( ...
                    {'*.xlsx;', 'excel files (*.xlsx)';...
                    '*.xls;', 'excel files (*.xls)'; ...
                    '*.*',       'All Files (*.*)'},...
                    'Select an excel file');
    if isequal(colors_filename,0), return; end;
    
commands.setNodeColors(guidata(obj), [colors_pathname colors_filename]);
% end Add colors;
