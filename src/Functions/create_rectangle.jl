module create_rectangle 
    export Crectangle
    using LaTeXStrings

    function Crectangle(ProjectName::String, PackagePath::String, XStart::Float64, YStart::Float64, ZStart::Float64, Width::Float64, Height::Float64, WhichAxis::String, RectName::String, PEC::String, PECnumber::Int64)
    
        file = open("$(PackagePath)\\Julia2Hfss.jl\\src\\Functions\\create_rectangle.vbs", "w")
        write(file, "Dim oAnsoftApp\n")
        write(file, "Dim oDesktop\n")
        write(file, "Dim oProject\n")
        write(file, "Dim oDesign\n")
        write(file, "Dim oEditor\n")
        write(file, "Dim oModule\n")
        write(file, "Set oAnsoftApp = CreateObject(\"AnsoftHfss.HfssScriptInterface\")\n")
        write(file, "Set oDesktop = oAnsoftApp.GetAppDesktop()\n")
        write(file, "oDesktop.RestoreWindow\n")
        write(file, "Set oProject = oDesktop.SetActiveProject(\"$(ProjectName)\")\n")
        write(file, "Set oDesign = oProject.SetActiveDesign(\"HFSSDesign1\")\n")
        write(file, "Set oEditor = oDesign.SetActiveEditor(\"3D Modeler\")\n")
        write(file, "oEditor.CreateRectangle Array(\"NAME:RectangleParameters\", \"IsCovered:=\", true, _\n")
        write(file, "\"XStart:=\", \"$(XStart)mm\", \"YStart:=\", \"$(YStart)mm\", \"ZStart:=\", \"$(ZStart)mm\", _\n")
        write(file, "\"Width:=\", \"$(Width)mm\", \"Height:=\", \"$(Height)mm\", \"WhichAxis:=\", \"$(WhichAxis)\"), _\n")
        write(file, "Array(\"NAME:Attributes\", \"Name:=\", \"$(RectName)\", \"Flags:=\", \"\" , \"Color:=\", _\n")
        write(file, " \"(132 132 193)\", \"Transparency:=\", 0, \"PartCoordinateSystem:=\", _\n")
        write(file, " \"Global\", \"UDMId:=\", \"\", _\n")
        write(file ,"\"MaterialValue:=\", \"\" & Chr(34) & \"vacuum\" & Chr(34) & _\n")
        write(file, "\"\", \"SolveInside:=\",  true)\n")
        if PEC == "yes"
            write(file, "Set oModule = oDesign.GetModule(\"BoundarySetup\")\n")
            write(file, "oModule.AssignPerfectE Array(\"NAME:PerfE$(PECnumber)\", \"Objects:=\", Array(\"$(RectName)\"), _\n")
            write(file, "\"InfGroundPlane:=\", false)\n")
        end
        close(file)
    end
end