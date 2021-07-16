function h = create_error_ellipse(cnt,rads,color,axh)
% cnt is the [x,y] coordinate of the center (row or column index).
% rads is the [horizontal, vertical] "radius" of the ellipses (row or column index).
% axh is the axis handle (if missing or empty, gca will be used)
% h is the object handle to the plotted rectangle.
% The easiest approach IMO is to plot a rectangle with rounded edges. 
% EXAMPLE
    %center = [1, 2];         %[x,y] center (mean)
    %stdev = [1.2, 0.5];      %[x,y] standard dev.
    %h = create_error_ellipse(center, stdev)
    %axis equal
% get axis handle if needed
if ~exist('axh','var') || isempty(axh)
   axh = gca();  
end
% Compute the lower, left corner of the rectangle.
llc = cnt(:)-rads(:);
% Compute the width and height
wh = rads(:)*2; 
% Draw rectangle 
h = rectangle(axh,'Position',[llc(:).',wh(:).'],'Curvature',[1,1]); 
set(h,'edgecolor',color,'facecolor','none','linewidth',2);
end