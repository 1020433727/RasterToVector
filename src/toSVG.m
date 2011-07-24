function toSVG( fillColors, strokeColors, strokeWidths, points )

% Get File to Save
[filename, pathname] = uiputfile( { '*.svg','Scalable Vector Graphics (*.svg)' }, 'Save figure as','../out');
%if user cancels save command, nothing happens
if isequal( filename, 0 ) || isequal( pathname, 0 )
else
    file = fullfile( pathname, filename );
    % Open File with write permision
    fid = fopen( file, 'w');
    
    % Print Header
    fprintf( fid, '<?xml version="1.0" standalone="yes"?>\n' );
    fprintf( fid, '<!DOCTYPE svg PUBLIC "raster to vector" "scott & donovan">\n' );
    
    % SVG Code
    fprintf( fid, '<svg width="100%%" height="100%%" version="1.1">\n' );
    
    % Create Polygons
    [m,n] = size( points );
    for i = 1:m
        % Points
        fprintf( fid, '<polygon points="' );
        j = 1;
        while j <= n
            fprintf( fid, '%i,%i ', points( i, j ), points( i, j + 1 ) );
            j = j + 2;
        end
        % Fill  
        fprintf( fid, '" fill="' );
        fprintf( fid, fillColors( i, : ) );
        fprintf( fid, '" stroke="' );
        fprintf( fid, strokeColors( i, : ) );
        fprintf( fid, '" stroke-width="%i', strokeWidths( i ) );
        fprintf( fid, '"/>\n' );
    end
    
    % Create Curves
   
    fprintf( fid, '</svg>\n' );
    
% docNode = com.mathworks.xml.XMLUtils.createDocument( 'svg' ); 
% docRootNode = docNode.getDocumentElement; 
% docRootNode.setAttribute( 'standalone', 'yes' );
% 
% %Create Node
% polyNode = generatePolygon( docNode );
% 
% % Insert Data
% %worldNode.appendChild( docNode.createTextNode( sprintf( '%s', 'Hello World!' ) ) );
% 
% % Position Nodes
% %helloNode.appendChild( worldNode );
% %docRootNode.appendChild( helloNode );
% docRootNode.appendChild( polyNode );





    
   % xmlwrite( file, docNode ); 
   
   %fprintf( fid, '<?xml version="1.0" standalone="yes"?> \n <!DOCTYPE svg PUBLIC "raster to vector" "scott & donovan">' );
%                  '<svg width="100%" height="100%" version="1.1"> \n', ...
%                  '<circle cx="100" cy="50" r="40" stroke="black"stroke-width="2" fill="red"/> \n', ...
%                  '<rect x="0.5cm" y="0.5cm" width="2cm" height="1cm"/> \n', ...
%                  '</svg>' );
   edit( file ); 
end
end

function [polyNode] = generatePolygon( docNode )
polyNode = docNode.createElement( 'polygon' );
polyNode.setAttribute('d', sprintf( '%s', 'polygon points"220,100 300,210 170,250"style="fill:#cccccc;stroke:#000000;stroke-width:1"' ) );
end