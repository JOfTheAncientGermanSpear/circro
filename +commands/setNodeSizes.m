function setNodeSizes(v, sizes_full_path)
node_sizes = fileUtils.loadSizes(sizes_full_path);
v.node_sizes=node_sizes;
num_node_size=numel(node_sizes);
list_node_sizes(1:num_node_size/2,2)=flipud(((num_node_size/2)+1:num_node_size)'); % here in case I decide to add display values in the future
if isfield(v,'list_regions')
    list_regions=v.list_regions; % nodes were previously selected
else
    temp=[(1:num_node_size/2)' flipud((((num_node_size/2)+1):num_node_size)')]; % nodes were not previously selected- assigning names
    list_regions=(num2cell(temp));
end
node_sizes=v.node_sizes;
guidata(v.hMainFigure,v)
drawing.draw_circle(v, list_regions,node_sizes);
fprintf('Drawing circle with %d regions\n',numel(list_regions))
if exist('list_regions','var')
    drawing.write_names(list_regions,(1+max(node_sizes(:))),pi/2);
end