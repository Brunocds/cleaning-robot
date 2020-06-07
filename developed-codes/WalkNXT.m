function WalkNXT(distance,speed)
%This function makes the robot walk in the distance and speed
%wanted.
%The inputs are the distance, that must be in centimeters, and the speed,
%that varies from -100 to 100.
%If the speed is positive, the robot will walk forward, if it is negative,
%it'll drive backward. 
%Example: WalkNXT(17.59,100)

radius = 2.8; 
perimeter = 2*pi*radius;
angle = int64((360/perimeter)*distance); %this come from a three rule, that 2pir makes the wheel rotate 360 degrees

motorAB = NXTMotor();
motorAB.Port = 'AB';
motorAB.SpeedRegulation = 0;
motorAB.Power = -speed;
motorAB.TachoLimit = angle;

motorAB.SendToNXT();
motorAB.WaitFor();

end

