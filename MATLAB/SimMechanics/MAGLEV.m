%clean_up
clearvars
close all

%define paramaters
Grav = '[0 0 -10]'; %Gravity Vector (m/s^2)
%GravU = 'm/s^2'; %Gravity Units
Z0 = '4.0'; %Initial Position
Horizontal = '90'; % Rotation Angle Rigid Transform
Vertical = '180'; % Rotation Angle Rigid Transform
Inclined = '120'; % Rotation Angle Rigid Transform
VertUp = '0'; % Rotation Angle Rigid Transform
Mass = '.15'; %Mass of the Object

set_param('MAGLEV/Spring',...
          'PositionTargetValue',Z0);
     
set_param('MAGLEV/Rigid Transform',...
          'RotationAngle',VertUp);
     
set_param('MAGLEV/Mechanism Configuration',...
          'GravityVector',Grav);    

%set_param('MAGLEV/Mechanism Configuration',...
 %         'GravityUnits',GravU);       
     
set_param('MAGLEV/Mass',...
          'Mass',Mass);     
     
     
     