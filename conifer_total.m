load('conifer.mat');
hold on;
shuganc = [0.7 0.5 0.04];
total_tri = [];
Ubranch = Ubranch+3;
num = 15;
for i = 1:size(Ubranch,1)
    [x,y,z]=cylinder(linspace(1,0,num),num);
    x = EW(i)*x+x1(i);
    y = SN(i)*y+y1(i);
    z=(z-1)*(Height(i)-Ubranch(i))+Height(i) ;
%      surf(x,y,z,'EdgeColor','none');
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
    total_tri = [total_tri;total_tri1];
    [u,v,w] = cylinder(0.5);
    u = u+x1(i);
    v = v+y1(i);
    w = w*Ubranch(i);
    shugan = mesh(u,v,w);
    set(shugan,'EdgeColor',shuganc,'FaceColor',shuganc,'MarkerEdgecolor',shuganc,'MarkerFacecolor',shuganc)
end
% for i = 1:size(total_tri,1)
%     patch(total_tri(i,1:3),total_tri(i,4:6),total_tri(i,7:9),[0 0 1]);
% end
axis equal
view(50,30)
xlabel('x');
ylabel('y');


