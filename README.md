# Water Mirror Cleaner Robot 

## Project Overview

I developed this project as my scientific initiation as a CNPq's fellow, from August 2018 to July 2019. The scientific initiation aimed to develop a code for a robot to perform the cleaning of generic water mirrors in an autonomous way and to analyze its energy consumption. The following activities were developed:

* Development of the algorithm and code, programming in MATLAB.
* Assembly of the prototype using the LEGO MINDSTORMS NXT kit.
* Data analysis and treatment using Excel.
* Study and application of numerical methods for filtering and interpolating data.

All the developed codes are generical and can be used to any water mirror.

## Documentation

The documentation of this project is divided in three folders:

* [reports](https://github.com/Brunocds/cleaning-robot/tree/master/reports): this folder contains a detailed documentation, explaining in depth the obtaining process of the necessary files to run the codes and the analysis and results of the project.
* [developed-codes](https://github.com/Brunocds/cleaning-robot/tree/master/developed-codes): this folder contains all the developed codes during the project and a briefly explanation of each one. 
* [files-to-be-read](https://github.com/Brunocds/cleaning-robot/tree/master/files-to-be-read): this folder contains the files I utilized in the project. The results of the use of these files are discussed in the files inside the reports folder.  

## Operational Structure

### Files To Be Read

Before running the codes, it's necessary to have the coordinates of the vertices from the water mirror's graph and the trajectory that the robot will do through these vertices. Given that, the developed codes need two files:

* __Graph's vertices file__: this file has to be in the format of "Surface Evolver" Data File, usually with the extension ".fe", containing the index of each vertice along with its x, y and z coordinates. 
* __Trajectory file__: this file can be a simple text file containing the indexes numbers of the graph's vertices file, one per line, in the order desired by the robot to go through. One important detail of this file is that it must have a "\\" character in the last line.

In order to the developed codes work properly, both files must be in MatLab's path. 

### Bluetooth Connection

It's possible to use the NXT robot connected via USB, but it isn't a good option given that the cable would limit its moviments. To avoid this it's possible to use a bluetooth connection. In the beggining of the [main.m](https://github.com/Brunocds/cleaning-robot/blob/master/developed-codes/main.m) file, we have:

~~~
h = COM_OpenNXT('bluetooth.ini');
COM_SetDefaultNXT(h);
~~~

These two lines makes the connection of the MatLab with NXT via bluetooth, to understand more about how it works you can check [here](https://www.mindstorms.rwth-aachen.de/documents/downloads/doc/version-2.00/help/COM_OpenNXT.html), but briefly explaining in order to do the bluetooth connection it's necessary to have a _bluetooth.ini_ file, that contains some parameters. The _bluetooth.ini_ file I used contains the following parameters:

>[Bluetooth]
>
>NXT-Name=mais1
>
>NXT-MAC=
>
>Channel=1
>
>BaudRate=9600
>
>DataBits=8
>
>SendSendPause=5
>
>SendReceivePause=25
>
>Timeout=2

To do the programs work in your NXT, you can use these parameters changing the "NXT-Name=" and "Channel=" according to yours.

### Programs

All the developed codes, as well as the files to be read, need to be in MatLab's path in order to work properly. If all these files are in the MatLab's path and the computer and NXT are connected via bluetooth, you only need to run the [main.m](https://github.com/Brunocds/cleaning-robot/blob/master/developed-codes/main.m) in MatLab in order to make the robot go through all points of the water mirror, cleaning it. 

### MatLab Help Command

To understand what each code do, what it returns or what parameter should be used, just you type in MatLab's command window "help program_name", writing the name of the program in "program_name", that will be displayed all this information.
