function crabs ()
  % Crabs is a kids computer game where a fisherman, called the captain,
  % hunts for a very clever and powerful crab.

  % Draw the game map and initialize map dimensions.
  [mapHeight , mapWidth] = drawMap( "BGImage.png" );



  % Initialize captain location, heading and size
  xCapt = 1500;
  yCapt = 900;
  thetaCapt = -pi/2;
  sizeCapt = 50;

  % Draw the captain and initialize graphics handles
  captGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);

  % Initial value for smoothing motion for captain
  rotationFactor = 1;
  rotationDirection = 0;



  % Initialize crab location, heading and size
  xCrab = 1700;
  yCrab = 1100;
  thetaCrab = -pi/2;
  sizeCrab = 25;

  % Draw the crab and initialize graphics handles
  crabGraphics = drawCrab(xCrab, yCrab, thetaCrab, sizeCrab);



  % Main loop for game
  while(1)
    cmd = kbhit(1);

    % Quitting if Shift + Q
    if(cmd == "Q")
      break
    endif

    % Custom logic for rotation, so that its smooth
    if(cmd == "a" || cmd == "d")
      % Setting direction
      if(cmd == "a")
        rotationDirection = -1;
      endif
      if(cmd == "d")
        rotationDirection = 1;
      endif

      % Speeding up his rotation
      if(rotationFactor + 0.3333 < 1)
        rotationFactor = rotationFactor + 0.3333;
      else
        rotationFactor = 1;
      endif
    else
      % Slowing down his rotation
      if(rotationFactor - 0.3333 > 0)
        rotationFactor = rotationFactor - 0.3333;
      else
        rotationFactor = 0;

        % Setting direction
        rotationDirection = 0;
      endif
    endif




    % Remove current drawn captain
    for(i = 1:length(captGraphics))
      set(captGraphics(i), 'visible', 'off');
    endfor

    % Getting new captain position & heading
    [xCapt, yCapt, thetaCapt] = moveCapt(xCapt, yCapt, thetaCapt, cmd, rotationDirection, rotationFactor);

    % Place new captain
    captGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);



    % Remove current drawn captain
    for(i = 1:length(crabGraphics))
      set(crabGraphics(i), 'visible', 'off');
    endfor

    % Getting new crab position & heading
    [xCrab, yCrab, thetaCrab] = moveCrab(xCrab, yCrab, thetaCrab, cmd);

    % Placing new crab
    crabGraphics = drawCrab(xCrab, yCrab, thetaCrab, sizeCrab);



    pause(0.005);
  endwhile
endfunction
