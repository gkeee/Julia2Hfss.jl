module create_closed_fractal 
    export Cclosedfractal
    using LaTeXStrings  
    function Cclosedfractal(ProjectName::String, PackagePath::String, LineName::String, Geometry::String, Length::Float64 )
        
        file = open("$(PackagePath)\\Julia2Hfss.jl\\src\\Functions\\create_closed_fractal.vbs", "w")
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
        
        if Geometry == "square"
        
            write(file, "oEditor.Move Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)\", \"NewPartsModelFlag:=\",  _\n")
            write(file, "\"Model\"), Array(\"NAME:TranslateParameters\", \"TranslateVectorX:=\", \"0mm\", \"TranslateVectorY:=\",  _\n")
            write(file, "\"0mm\", \"TranslateVectorZ:=\", \"0mm\")\n")
            write(file, "Set oEditor = oDesign.SetActiveEditor(\"3D Modeler\")\n")
            write(file, "oEditor.ChangeProperty Array(\"NAME:AllTabs\", Array(\"NAME:Geometry3DCmdTab\", Array(\"NAME:PropServers\",  _\n")
            write(file, "\"KochLine:Move:1\"), Array(\"NAME:ChangedProps\", Array(\"NAME:Move Vector\", \"X:=\", \"-$(Length/2)mm\", \"Y:=\",  _\n")
            write(file, "\"$(Length/2)mm\", \"Z:=\", \"0mm\"))))\n")
            write(file, "Set oEditor = oDesign.SetActiveEditor(\"3D Modeler\")\n")
            for i in 1:3

                if i==1
                    write(file, "oEditor.Copy Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)\")\n")
                else
                    write(file, "oEditor.Copy Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)$(i-1)\")\n")
                end
                write(file, "oEditor.Paste\n")
                write(file, "oEditor.Rotate Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)$(i)\", \"NewPartsModelFlag:=\",  _\n")
                write(file, "\"Model\"), Array(\"NAME:RotateParameters\", \"RotateAxis:=\", \"Z\", \"RotateAngle:=\",  _\n")
                write(file, "\"90deg\")\n")

            end
            write(file, "oEditor.Unite Array(\"NAME:Selections\", \"Selections:=\",  _\n")
            write(file, "\"$(LineName)3,$(LineName)2,$(LineName)1,$(LineName)\"), Array(\"NAME:UniteParameters\", \"KeepOriginals:=\",  _\n")
            write(file, "false, \"TurnOnNBodyBoolean:=\", true)\n")
            write(file, "oEditor.CoverLines Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)3\", \"NewPartsModelFlag:=\",  _\n")
            write(file, "\"Model\")\n")

        elseif Geometry == "triangle"
        
        elseif Geometry == "rectangle"
        
        else println("Geometry Options:\n-square\n-triangle\n-rectangle");     
        end
        
        close(file)

    end
end