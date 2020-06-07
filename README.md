# Water Mirror Cleaner Robot 

## Project Overview

I developed this project as my scientific initiation as a CNPq's fellow, from August 2018 to July 2019. The scientific initiation aimed to develop a code for a robot to perform the cleaning of generic water mirrors in an autonomous way and to analyze its energy consumption. The following activities were developed:

* Development of the algorithm and code, programming in MATLAB.
* Assembly of the prototype using the LEGO MINDSTORMS NXT kit.
* Data analysis and treatment using Excel.
* Study and application of numerical methods for filtering and interpolating data.

## Documentation

A detailed documentation, explaining in depth the obtaining process of the necessary files to run the codes and the results of the project, is available in the (reports)[uol.com.br] folder. 

## Operational Structure

### Files to be read

Before running the codes, it's necessary to have the coordinates of the vertices from the water mirror's graph and the trajectory that the robot will do through these vertices. Given that, the developed codes need:

* __Graph's vertices file__: this file has to be in the format of "Surface Evolver" Data File, usually with the extension ".fe", containing the index of each vertice along with its x, y and z coordinates. 
* __Trajectory file:__ : this file can be a simple text file containing the indexes numbers of the graph's vertices file, one per line, in the order desired by the robot to go through. One important detail of this file is that it must have a "\" character in the last line.

### Programs 

