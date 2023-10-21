## Author: HP <HP@ANDREWS-LAPTOP> adapted from  Ken Owens' code
## Created: 2023-10-13

function inBounds = isOnMap(x, y, width, height, buffer)
  if( x > buffer && x < width-buffer && y > buffer && y < height-buffer)
    inBounds=1;
  else
    inBounds=0;
  endif
endfunction
