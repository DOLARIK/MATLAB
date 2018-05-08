% clean up
clearvars
close all

% define some parameters
Grav = '[0 0 -9.81]'; % Gravity Vector (m/s^2)
Z0   = '15.0'; % Initial Position Vector (cm)
Horizontal = '90' % Rigid Transform Rotation Angle (deg)
Vertical = '180' % Rigid Transform Rotation Angle (deg)
Inclined = '120' % Rigid Transform Rotation Angle (deg)

set_param('AnyVibratingMass0/Spring',...
          'PositionTargetValue',Z0);
      
set_param('AnyVibratingMass0/Mechanism Configuration',...
          'GravityVector',Grav);  
      
set_param('AnyVibratingMass0/Rigid Transform',...
          'RotationAngle',Horizontal);