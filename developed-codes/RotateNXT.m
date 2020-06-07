function RotateNXT(angle,speed)
%This function makes the robot rotate the degrees given in the input in the
%wanted speed. 

r = (5.5/2.8);
x = angle*r;

motorA = NXTMotor();
motorA.Port = 'A';
motorA.Power = (-1*speed);
motorA.TachoLimit = (int64(x));

motorB = NXTMotor();
motorB.Port = 'B';
motorB.Power = speed;
motorB.TachoLimit = (int64(x));

motorA.SendToNXT();
motorB.SendToNXT();

motorA.WaitFor();
motorB.WaitFor();

end
