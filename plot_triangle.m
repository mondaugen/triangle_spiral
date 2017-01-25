f=fopen('/tmp/pts.txt','r');
x=fscanf(f,'%f %f %f\n',inf);
fclose(f);
x_=reshape(x,3,length(x)/3)';
plot3(x_(:,1),x_(:,2),x_(:,3));
xlabel('x1');
ylabel('x2');
zlabel('x3');
