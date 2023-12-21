module create_line_intersection 
    export Clineintsec
    using LaTeXStrings  
    function Clineintsec(ProjectName::String, VBSfilePath::String, LineName::String, X::Vector, Y::Vector)
    
        PointsNumber = length(X);
        file = open("$(VBSfilePath)\\create_line_intersection.vbs", "w")
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
        for i in 1:(PointsNumber-1)
            x₀=X[i];
            y₀=Y[i];
            x₁=X[i+1];
            y₁=Y[i+1];
            write(file, "oEditor.CreatePolyline Array(\"NAME:PolylineParameters\", \"IsPolylineCovered:=\", true, \"IsPolylineClosed:=\", false,  _\n")
            write(file, "Array(\"NAME:PolylinePoints\", _\n")
            write(file, "Array(\"NAME:PLPoint\", \"X:=\", \"$(x₀)mm\", \"Y:=\", \"$(y₀)mm\", \"Z:=\", \"0mm\"), _\n")
            write(file ,"Array(\"NAME:PLPoint\", \"X:=\", \"$(x₁)mm\", \"Y:=\", \"$(y₁)mm\", \"Z:=\", \"0mm\")), _\n")  
            write(file, "Array(\"NAME:PolylineSegments\", Array(\"NAME:PLSegment\", \"SegmentType:=\",  _\n")
            write(file, "\"Line\", \"StartIndex:=\", 0, \"NoOfPoints:=\", 2, \"NoOfSegments:=\", \"0\")), Array(\"NAME:PolylineXSection\", \"XSectionType:=\",  _\n")
            write(file, "\"None\", \"XSectionOrient:=\", \"Auto\", \"XSectionWidth:=\", \"0mm\", \"XSectionTopWidth:=\",  _\n")
            write(file, "\"0mm\", \"XSectionHeight:=\", \"0mm\", \"XSectionNumSegments:=\", \"0\", \"XSectionBendType:=\",  _\n")
            write(file, "\"Corner\")), Array(\"NAME:Attributes\", \"Name:=\", \"$(LineName)_$(i)\", \"Flags:=\", \"\", \"Color:=\",  _\n")
            write(file, "\"(143 175 143)\", \"Transparency:=\", 0, \"PartCoordinateSystem:=\", \"Global\", \"UDMId:=\",  _\n")
            write(file, "\"\", \"MaterialValue:=\", \"\" & Chr(34) & \"vacuum\" & Chr(34) & \"\", \"SurfaceMaterialValue:=\",  _\n")
            write(file, "\"\" & Chr(34) & \"\" & Chr(34) & \"\", \"SolveInside:=\", true, \"ShellElement:=\",  _\n")
            write(file, "false, \"ShellElementThickness:=\", \"0mm\", \"ReferenceTemperature:=\", \"20cel\", \"IsMaterialEditable:=\",  _\n")
            write(file, "true, \"UseMaterialAppearance:=\", false, \"IsLightweight:=\", false)\n")
        end
        close(file)
    end
end