# 1.Run process

**Note: the file loading path needs to be adjusted**    

The procedure should be executed in the following order to accomplish the solar radiation calculation. The specific steps are as follows: the vector of incident light calculation, tree plot modeling, determination of the distribution range of incident light source points, intersection of solar beams (incident, reflected and transmitted) with target forest plots and calculation and rendering of plot radiant flux. 

## 1.1 Run incident vector calculation program
 
    Run angle_cal.m file to obtain and save the result (sun.mat), which contains the current sun altitude and azimuth angles taken as the input for anglecalculate.m file. 

**Note: Input date, latitude, longitude, time and other parameters, the current sun altitude and azimuth angle can be automatically calculated**

    Run anglecalculate.m and save the result of solar light beam vector (ndir.mat) in the folder  **Note: The input parameters here are the azimuth and zenith angles obtained after running angle_cal.m**

## 1.2 Run tree plot modeling program

 **Note: Different plots in this experiment have a separate folder.
    Run the conifer_total.m file for the conifer plot, and save the corresponding result (total_tri.mat) in the folder named “conifer”.
    Run the broadleaf_total.m file for the broadleaf plot, and save the corresponding result (total_tri.mat) in the folder named “broadleaf”.
    Run the mixed_total.m file for the mixed plot, and save the corresponding result (total_tri.mat) in the folder named “mixed_tree”.

## 1.2 Run the program of determination of the distribution range of incident light source points 

    Run the findchushi.m file, and save the result (chushi.mat) in the folder

## 1.3 Run intersection calculation program

    Run the radiationmap.m file which corresponds to the simulation of incident solar beams illuminated the current forest plot., and save the result (total_sec.mat) in the folder. The result only manifests the first intersection points of each solar beam with triangles of forest plots.
    Then run the radiationmap_reflect.m file which corresponds to the simulation of reflected solar beams illuminated the current forest plot., and manually save the result (total_secref.mat) in the folder
    Then run the radiationmap_refract.m file which corresponds to the simulation of transmitted solar beams illuminated the current forest plot., and manually save the result (total_secrefract.mat) in the folder   **Note: Before running radiationmap_refract.m file, it is necessary to comment out the last three lines of code in the radiationmap.m file in order to acquire all the intersected points between the incident solar beams and triangles of forest plots, and then recalculate the "total_sec.mat" for radiationmap_refract.m.**

## 1.4 Calculating and rendering of forest plot radiant flux program

 **Note1: The trunks of three forest plots can be simulated separately in conifer.m, broadleaf.m and mixed.m files; rgbxxx.mat" is a n*3 matrix representing the RGB value regarding the adopted colorbar here **

    Run incident.m, reflect.m, refract.m files consequently rendering the visual results of the illuminated forest plot and save the results (total_energy) in the folder

# 2. key parameters

**Note: The triangulation and the spacing of the incident sample points affect the running time and results of our entire program**

## 2.1 parameters in tree plot modeling

```matlab
% parameters in conifer_total.m
num = 15 % The number of sampling points on the triangulation concentric circles
```

## 2.2 parameters in radiant flux calculation

```matlab
% parameters in radiationmap.m
x0 = (chushi(1):acc:chushi(2))'; % The sampling interval of the incident light source point
y0 = (chushi(3):acc:chushi(4))';

