## Author: HP <HP@ANDREWS-LAPTOP>
## Created: 2023-10-13

function [xCrab, yCrab, thetaCrab] = moveCrab (x, y, theta, cmd)
    % Variables for movement amounts
  dTheta = pi/6;
  dStep = 50;

  % Setting default values, for if no movement is commanded
  xCrab = x;
  yCrab = y;
  thetaCrab = theta;

  if(cmd == "j")
    %move captain forward
    xCrab = x + sin(theta)*dStep;
    yCrab = y + -cos(theta)*dStep;
  elseif (cmd == "l")
    %move captain forward
    xCrab = x + -sin(theta)*dStep;
    yCrab = y + cos(theta)*dStep;
  endif

  if(cmd == "u")
    %rotate the captain left
    thetaCrab = theta - dTheta;
  endif

  if(cmd == "o")
    %rotate the captain right
    thetaCrab = theta + dTheta;
  endif
endfunction
