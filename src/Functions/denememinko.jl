using LaTeXStrings
using Plots
using LinearAlgebra
w1 = [1/4 0 0;
      0 1/4 0;
      0 0 1]
w2 = [0 -1/4 1/4;
      1/4 0 0;
      0 0 1]
w3 = [1/4 0 1/4;
      0 1/4 1/4;
      0 0 1]
w4 = [0 1/4 1/2;
     -1/4 0 1/4;
      0 0 1]
w5 = [0 1/4 1/2;
     -1/4 0 0;
      0 0 1]
w6 = [1/4 0 1/2;
      0 1/4 -1/4;
      0 0 1]
w7 = [0 -1/4 3/4;
      1/4 0 -1/4;
      0 0 1]
w8 = [1/4 0 3/4;
      0 1/4 0;
      0 0 1]
v1 = [0 1;
      0 0;
      1 1]
iter=4;
y=[]
for i = 1:iter
    y1a = w1 * v1
    y2a = w2 * v1
    y3a = w3 * v1
    y4a = w4 * v1
    y5a = w5 * v1
    y6a = w6 * v1
    y7a = w7 * v1
    y8a = w8 * v1
    y = [y1a y2a y3a y4a y5a y6a y7a y8a]
    v1 = y
end
_length=1.0;
y = _length * y[1:2, :]
r, c = size(y)
fixed_point = []
width=1.0;
line,column=size(y);
k=0;
for j in 1:line
    k=0;
    for i in 1:column
        if i==1
            k=1;
        else
            if i==column
                k=k+1;
            end
            if mod(i,2)==0 && i!=column
                k=k+1;
            end
        end
    end
end
YY=zeros(line,k);
for j in 1:line
    k=1;
    for i in 1:column
        if i==1
            YY[j,i]=y[j,i];
        else
            if i==column
                k=k+1;
                YY[j,k]=y[j,i];
            end
            if mod(i,2)==0 && i!=column
                k=k+1;
                YY[j,k]=y[j,i];
            end
        end
    end
end        


for i = 1:2:c-3
    vector1 = [y[1, i] - y[1, i+1];
              y[2, i] - y[2, i+1]]
    vector2 = [y[1, i+3] - y[1, i+2];
              y[2, i+3] - y[2, i+2]]
    A = vector1
    B = vector2
    angle = acos(dot(A, B) / (norm(A) * norm(B))) * 180 / pi
    angle = round(angle)
    if angle == 120
        point = (A + B) * width
    else
        point = -(A + B) * width
    end
    # fixed_point = [fixed_point point + y[:, i + 1]]
    fixed_point = vcat([fixed_point, point + y[:, i+1]]...)
end