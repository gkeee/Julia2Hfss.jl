module FIF_IFS 
    export transformfif
    using LaTeXStrings

    function ω_cof(x, y, d)
        N = length(x)
        h = x[N] - x[1]
        a = zeros(N - 1)
        e = zeros(N - 1)
        c = zeros(N - 1)
        ff = zeros(N - 1)
        for n = 1:N-1
            a[n] = (x[n+1] - x[n]) / h
            e[n] = (x[N] * x[n] - x[1] * x[n+1]) / h
            c[n] = ((y[n+1] - y[n]) - d[n] * ((y[N] - y[1]))) / h
            ff[n] = ((x[N] * y[n] - x[1] * y[n+1]) - d[n] * (x[N] * y[1] - x[1] * y[N])) / h
        end
        return (a, c, e, ff)
    end

    function interpolate(x, y, d, K)
        N = length(x)
        f0 = t -> (y[N] - y[1]) / (x[N] - x[1]) * (t - x[N]) + y[N]
        return interpolate(f0, x, y, d, K)
    end

    function interpolate(f0, x, y, d, K)
        function template(f)
            a, c, e, ff = ω_cof(x, y, d)
            idx = 1:length(x)
            function f_next(xd)
                b_i = x .< xd
                if all(b_i)
                    return y[end]
                elseif any(b_i)
                    n = idx[b_i][end]
                    temp = c[n] * ((xd - e[n]) / a[n]) + d[n] * f((xd - e[n]) / a[n]) + ff[n]
                    return temp
                else
                    return y[1]
                end
            end  # f_next
            return f_next
        end # template
    
        # f1 = template(f0)
        # sigma = maximum(d)
        # g(x) = f1(x) - f0(x)
        # m = norm_estimate_1(g, x[1], x[end])
        # K = ceil(Int, log(epsilon * (1-sigma) / m) / log(sigma))
        f = f0
        for n = 1:K
            f = template(f)
        end
        return f
    
    end



    function transformfif(x::Vector, y::Vector)
        
        n = length(x)
        d = 0.4 * ones(n - 1)
        K = 10
        f0 = t -> (y[N] - y[1]) / (x[N] - x[1]) * (t - x[N]) + y[N]
        xt = collect(range(x[1], x[end], 2000))
        f_interpolated = interpolate(x, y, d, K)
        yt = f_interpolated.(xt)
        return xt,yt

    end

end