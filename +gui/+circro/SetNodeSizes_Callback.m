function SetNodeSizes_Callback(obj, ~)
v=guidata(obj);
[sizes_filename, sizes_pathname] = uigetfile( ...
                    {'*.xlsx;', 'excel files (*.xlsx)';...
                    '*.xls;', 'excel files (*.xls)'; ...
                    '*.*',       'All Files (*.*)'},...
                    'Select an excel file');
if isequal(sizes_filename,0), return; end;
Circro('circro.setNodeSizes', [sizes_pathname sizes_filename]);
%end
