# Brief explanation of each file

All these codes were developed using MatLab and work together to do the orientation of the robot. 
Before running them, make sure the NXT robot is connected with the computer via bluetooth or USB.

* __main.m__: This code contains the algorithm that guides the robot. Also, you can set the speed of rotation and movimentation changing parameters inside of it. 
* __readtraj.m__: This code reads the trajectory file and saves all the values of the trajectory file into a vector. This vector is used in main's algorithm to define the order of the vertices from the graph that the robot will go through.    
* __readvert.m__: This code reads and graph file saves all the values of the vertices file into a vector of structures (you can think of it as a matrix). This vector is used in main's algorithm to store the coordinates of the vertices that the robot will go through.
* __vectortraj.m__: Once you have done the vertices and the trajectory vectors, this code make the struct array of the vectors that the robot will use to walk in main's algorithm.
* __RotateNXT.m__: This code rotates the robot the degrees given in the input in the wanted speed. It's used in main's algorithm to move the robot. 
* __WalkNXT.m__: This code makes the robot walk in the distance and speed wanted. It's used in main's algorithm to move the robot. 
* __batteryvector.m__: This code isn't part of the main code, but it was used to analyze the energy consumption of the robot by storing the battery's output voltage into a vector to further analysis. 
* __remainingenergy.m__: This code uses the minimun squares method to create a polynomial that converts the battery's voltage output into battery's percentage of energy, using data extracted from an analysis of the experimental relation of battery percentage in function of output voltage, filtred with moving average. It's incorporated in main's algorithm as a function that returns the remaining energy of the robot in Joules, given the battery's output voltage value. 

