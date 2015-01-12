% --- creates renderings
function drawCircle(v,nodeColors,colorscheme)
axis square
delete(allchild(v.hAxes));%
set(v.hMainFigure,'CurrentAxes',v.hAxes)
set(0, 'CurrentFigure', v.hMainFigure);  %# for figures

if ~isfield(v, 'labels')
    error('labels must be added to draw a circle, see commands.setCircularNodeLabels or commands.addCircularDiagram')
end
labels = v.labels;

fprintf('Drawing circle with %d regions\n',numel(labels))
numNodes=numel(labels);
innerR = 1;
if ~isfield(v, 'nodeSizes')
    v.nodeSizes(1:numNodes,1)=innerR*1.1;
    nodeSizes = v.nodeSizes;
else
    tmp = v.nodeSizes;
    nodeSizes(1:numNodes/2,1)=tmp(1:end,1);
    nodeSizes(1:numNodes/2,2)=flipud(tmp(1:end,2));% flip the second column for sequential drawing of segments
    nodeSizes=nodeSizes+innerR;
end
if nargin>1
    listColors(1:numNodes/2,1)=nodeColors(1:end,1);
    listColors(1:numNodes/2,2)=flipud(nodeColors(1:end,2));
    listColors=[listColors(1:numNodes/2,1); listColors(1:numNodes/2,2)]; % organized into one single column 
else
    listColors=rand(numNodes,1);
    listColors(numNodes/2,1)=0.5;% set the mid value as on (to set the color as the mid-value
end
if nargin<3
    colorscheme=hot;
end

startRadian=pi/2; %sets the origin of the first segment (could also be 0)
endRadian=startRadian+(2*pi)/numNodes; %sets the end of the first segment (could also be pi/2)
% end constants

axis square        
for segment=1:numNodes % draw the circle
    % map colors
    color=utils.findColorInColorscheme(listColors(segment),listColors,colorscheme);           
    drawing.drawSegment(startRadian,endRadian,nodeSizes(segment),innerR,color,[])
    startRadian=endRadian;
    endRadian=startRadian+(2*pi)/numNodes;
    pause(0.01)
    hold on        
end
R=max(nodeSizes(:));
axis([-2.3*R 2.3*R -2.3*R 2.3*R])
axis square
axis off

radius = 1.2;
startRadian = pi/2;
drawing.writeLabels(v, radius, startRadian);

if isfield(v, 'links')
    drawing.drawLinks(v)
end