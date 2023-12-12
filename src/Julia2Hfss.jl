module Julia2Hfss

    include("Functions/close_active_project.jl")
    using .close_active_project

    include("Functions/new_project.jl")
    using .new_project

    include("Functions/open_project.jl")
    using .open_project

    include("Functions/create_rectangle.jl")
    using .create_rectangle

    include("Functions/create_spline.jl")
    using .create_spline

    include("Functions/create_line_intersection.jl")
    using .create_line_intersection

    include("Functions/create_line.jl")
    using .create_line

    include("Functions/FIF_IFS.jl")
    using .FIF_IFS
    
    include("Functions/Koch_Fractal.jl")
    using .Koch_Fractal

    include("Functions/create_closed_fractal.jl")
    using .create_closed_fractal

end
