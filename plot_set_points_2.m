inc = 0.1;
x1=0;
x2=0;
x3=0;
x=[];
for x1=(0:inc:1)
    for x2=(0:inc:(1-x1))
        x3 = 1 - x1 - x2;
        x=[x;[x1,x2,x3]];
    end
end

plot3(x(:,1),x(:,2),x(:,3));
xlabel('x1');
ylabel('x2');
zlabel('x3');
size(x)
