inc = 0.5;
x1=0;
x2=0;
x3=0;
x=[];
for x1=(0:inc:1)
    for x2=(0:inc:(1-x1))
        for x3=(0:inc:(1-x1-x2))
            x4 = 1 - x1 - x2 - x3;
            x=[x;[x1,x2,x3]];
            x=[x;[x2,x3,x4]];
            x=[x;[x3,x4,x1]];
            x=[x;[x4,x1,x2]];
        end
    end
end

plot3(x(:,1),x(:,2),x(:,3));
xlabel('x1');
ylabel('x2');
zlabel('x3');
size(x)
