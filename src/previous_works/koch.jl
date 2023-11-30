using Plots
using LinearAlgebra

@info "Defining the koch function"
function koch(_length, iter, width)
    w1 = [1/3 0 0;
        0 1/3 0;
        0 0 1]
    w2 = [(1/3)*cos(pi / 3) -(1 / 3)*sin(pi / 3) 1/3;
        (1/3)*sin(pi / 3) (1/3)*cos(pi / 3) 0;
        0 0 1]
    w3 = [(1/3)*cos(pi / 3) (1/3)*sin(pi / 3) cos(pi / 3);
        -(1 / 3)*sin(pi / 3) (1/3)*cos(pi / 3) (1/3)*sin(pi / 3);
        0 0 1]
    w4 = [1/3 0 2/3;
        0 1/3 0;
        0 0 1]
    v1 = [0 1;
        0 0;
        1 1]
    for i = 1:iter
        y1a = w1 * v1
        y2a = w2 * v1
        y3a = w3 * v1
        y4a = w4 * v1
        y = [y1a y2a y3a y4a]
        v1 = y
    end
    y = _length * y[1:2, :]
    p = plot!(y[1, :], y[2, :])
    r, c = size(y)
    vectors = []
    fixed_point = []
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
    plot!(fixed_point[1, :], fixed_point[2, :])
    savefig(p, "results.png")
    return y, fixed_point
end

_length = 1
iter = 3
width = 0.2
@info "Calling the function for the params " _length iter width
koch(_length, iter, width)