# EEE4120F 2024: YODA Sound Processing Module (SPM)

## Description
This repository contains the implementation of a Sound Processing Module (SPM) in Verilog for the EEE4120F 2024 YODA Project.
The SPM processes a 16-bit signed integer audio stream to find the minimum and maximum values over a given interval. 
Additionally, the minimum and maximum values are filtered to remove values outside of one standard deviation of their respective means.
The Verilog implementation is compared against the Golden Measure implementation written in MATLAB.

## Structure
* Audio_Samples: Contains the Wave and COE files used as audio samples
* Golden_Measure: Contains the Golden Measure MATLAB source code
* Simulation: Contains the output of the ATP simulation done in Vivado
* Source: Contains the SPM Verilog source code
* Vivado: Contains the SPM Vivado project files

## Authors
* Thomas Koen (KNXTHO003)
* Nathan Sieberhagen (SBRNAT004)
* Aimee Simons (SMNAIM002)
* Tilal Zaheer Mukhtar (MKHTIL001)