module create_rectangle 
    export Crectangle
    using LaTeXStrings

    function Crectangle(ProjectName::String, PackagePath::String, XStart::String, YStart::String, ZStart::String, Width::String, Height::String, WhichAxis::String, Name::String)
    
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
        write(file, "oEditor.CreateRectangle Array(\"NAME:RectangleParameters\", \"IsCovered:=\", true, \"XStart:=\", \"$(XStart)\", \"YStart:=\", \"$(YStart)\", \"ZStart:=\", \"$(ZStart)\", \"Width:=\", \"$(Width)\", \"Height:=\", \"$(Height)\", \"WhichAxis:=\", \"$(WhichAxis)\"), Array(\"NAME:Attributes\", \"Name:=\", \"$(Name)\", \"Flags:=\", \"\" , \"Color:=\", \"(132 132 193)\", \"Transparency:=\", 0, \"PartCoordinateSystem:=\", \"Global\", \"UDMId:=\", \"\", \"MaterialValue:=\", \"\" & Chr(34) & \"vacuum\" & Chr(34) & \"\", \"SolveInside:=\",  true) \n")
        close(file)
    end
end