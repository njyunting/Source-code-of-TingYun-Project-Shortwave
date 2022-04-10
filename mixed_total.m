load('gongzuoqu.mat');
hold on;
shuganc = [0.7 0.5 0.04];
total_tri_c = [];
Ubranch1 = Ubranch1+3;
num = 15;
for i = 1:size(Height1,1)
    [x,y,z]=cylinder(linspace(1,0,num),num);
    x = EW1(i)*x+x1(i);
    y = SN1(i)*y+y1(i);
    z=(z-1)*Height1(i)+Height1(i)+Ubranch1(i) ;
%     surf(x,y,z,'EdgeColor','none');
    %     Cylinder=mesh(x,y,z);
    tri = delaunay(x,y);
      h = trimesh(tri,x,y,z);
    total_tri1=[];
    for j = 1:size(tri,1)
        A = [x(tri(j,1)),x(tri(j,2)),x(tri(j,3))];
        B = [y(tri(j,1)),y(tri(j,2)),y(tri(j,3))];
        C = [z(tri(j,1)),z(tri(j,2)),z(tri(j,3))];
        total_tri1 = [total_tri1;A,B,C,i];
    end
    total_tri_c = [total_tri_c;total_tri1];
    [u,v,w] = cylinder(0.5);
    u = u+x1(i);
    v = v+y1(i);
    w = w*Ubranch1(i);
    shugan = mesh(u,v,w);
    set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)
end


%阔叶

shuganc = [0.7 0.5 0.04];
total_tri_b = [];
for i = 1:size(Ubranch2,1)
    [x,y,z] = ellipsoid(x2(i),y2(i),Ubranch2(i),0.5*EW2(i),0.5*SN2(i),(Height2(i)-Ubranch2(i)),num);
    [x0,y0] = find(z>=Ubranch2(i));
%     surf(x(x0,y0),y(x0,y0),z(x0,y0),'EdgeColor','none');
    tri = delaunay(x(x0,y0),y(x0,y0));
     h = trimesh(tri,x(x0,y0),y(x0,y0),z(x0,y0));
    x = x(x0,y0);
    y = y(x0,y0);
    z = z(x0,y0);
    total_tri1=[];
    for j = 1:size(tri,1)
        A = [x(tri(j,1)),x(tri(j,2)),x(tri(j,3))];
        B = [y(tri(j,1)),y(tri(j,2)),y(tri(j,3))];
        C = [z(tri(j,1)),z(tri(j,2)),z(tri(j,3))];
        total_tri1 = [total_tri1;A,B,C,33+i];
    end
    total_tri_b = [total_tri_b;total_tri1];
    [u,v,w] = cylinder(0.5);
    u = u+x2(i);
    v = v+y2(i);
    w = w*(Ubranch2(i)+2);
    shugan = mesh(u,v,w);
    set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)
end
total_tri = [total_tri_c;total_tri_b];
axis equal
view(31,43);
xlabel('x');
ylabel('y');


dingdian = (num*(0.5*num-1)+1)*28+(num*(num-1)+1)*33

edge = [];
for i = 1:size(total_tri,1)
    edge1 = sqrt((total_tri(i,2)-total_tri(i,1))^2+(total_tri(i,5)-total_tri(i,4))^2+(total_tri(i,8)-total_tri(i,7))^2);
    edge2 = sqrt((total_tri(i,3)-total_tri(i,1))^2+(total_tri(i,6)-total_tri(i,4))^2+(total_tri(i,9)-total_tri(i,7))^2);
    edge3 = sqrt((total_tri(i,2)-total_tri(i,3))^2+(total_tri(i,5)-total_tri(i,6))^2+(total_tri(i,8)-total_tri(i,9))^2);
    edge = [edge;edge1;edge2;edge3];
end
mean(edge)



