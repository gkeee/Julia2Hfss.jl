module create_line 
    export Cline
    using LaTeXStrings  
    function Cline(ProjectName::String, PackagePath::String, LineName::String, IsClosed::String, X::Vector, Y::Vector, Zstart::Float64)
    
        PointsNumber = length(X);
        file = open("$(PackagePath)\\Julia2Hfss.jl\\src\\Functions\\create_line.vbs", "w")
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
        if IsClosed == "yes"
            write(file, "oEditor.CreatePolyline Array(\"NAME:PolylineParameters\", \"IsPolylineCovered:=\", true, \"IsPolylineClosed:=\", true,  _\n")
            write(file, "Array(\"NAME:PolylinePoints\", _\n")
        elseif IsClosed == "no"
            write(file, "oEditor.CreatePolyline Array(\"NAME:PolylineParameters\", \"IsPolylineCovered:=\", true, \"IsPolylineClosed:=\", false,  _\n")
            write(file, "Array(\"NAME:PolylinePoints\", _\n")
        end
        for i in 1:PointsNumber
            x=X[i];
            y=Y[i];
            write(file, "Array(\"NAME:PLPoint\", \"X:=\", \"$(x)mm\", \"Y:=\", \"$(y)mm\", \"Z:=\", \"$(Zstart)mm\")")
            if i != PointsNumber
                write(file, ",  _\n")
            end
        end
        write(file, "),  _\n")
        write(file, "  Array(\"NAME:PolylineSegments\", _\n")
        for i in 1:(PointsNumber-1)
            write(file, "  Array(\"NAME:PLSegment\", \"SegmentType:=\", \"Line\", \"StartIndex:=\", $(i-1), \"NoOfPoints:=\", 2)")
            if i != (PointsNumber-1)
                write(file, ",  _\n")
            end
        end
        write(file, "  ), _\n")
        write(file, "  Array(\"NAME:PolylineXSection\", \"XSectionType:=\",  _\n")
        write(file, "  \"None\", \"XSectionOrient:=\", \"Auto\", \"XSectionWidth:=\", \"0mm\", \"XSectionTopWidth:=\",  _\n")
        write(file, "  \"0mm\", \"XSectionHeight:=\", \"0mm\", \"XSectionNumSegments:=\", \"0\", \"XSectionBendType:=\",  _\n")
        write(file, "  \"Corner\")), Array(\"NAME:Attributes\", \"Name:=\", \"$(LineName)\", \"Flags:=\", \"\", \"Color:=\",  _\n")
        write(file, "  \"(132 132 193)\", \"Transparency:=\", 0, \"PartCoordinateSystem:=\", \"Global\", \"UDMId:=\",  _\n")
        write(file, "  \"\", \"MaterialValue:=\", \"\" & Chr(34) & \"vacuum\" & Chr(34) & \"\", _\n")
        write(file, "  \"SolveInside:=\", true)\n")
        close(file)
    end
end