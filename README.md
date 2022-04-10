# Source-code-of-TingYun-Project-Shortwave
# 1.Run process

**Note: the file reading path needs to be adjusted**	

​	The procedure should be executed in the following order to accomplish the separation of incident vector calculation, tree plot modeling, boundary definition, intersection calculation and calculation and rendering of plot radiation. 

## 1.1 Run incident vector calculation program
 
​	Run angle_cal.m file and sava the result (sun.mat) corresponds to Aangle and Zangle in anglecalculate.m file in the folder
	Run anglecalculate.m and save the result (ndir.mat) in the folder

## 1.2 Run tree plot modeling program

 **Note: Since the different plots in this experiment have a separate folder, "total_tri.mat" is not differentiated**

​	Just run the conifer_total.m file, and save the result (total_tri.mat) in the folder
	Just run the broadleaf_total.m file, and save the result (total_tri.mat) in the folder
	Just run the mixed_total.m file, and save the result (total_tri.mat) in the folder

## 1.2 Run boundary definition program

	Just run the findchushi.m file, and save the result (chushi) in the folder

## 1.3 Run intersection calculation program

 **Note: The "total_sec.mat" imported when running radiationmap_refract.m file needs to comment out the last three lines of code in the radiationmap.m file**

​	Just run the radiationmap.m file, and save the result (total_sec.mat) in the folder
	Then run the radiationmap_reflect.m file, and save the result (total_secref.mat) in the folder
	Then run the radiationmap_refract.m file, and save the result (total_secrefract.mat) in the folder

## 1.4 Run calculation and rendering of plot radiation program

 **Note1: The trunk simulation of different forest stands is different, the detailed difference can be viewed in conifer.m, broadleaf.m and mixed.m files; rgbxxx.mat" is a color gradient n*3 rgb matrix**

​	Run incident.m, reflect.m, refract.m, file successively and save the result (total_energy) in the folder

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
```

