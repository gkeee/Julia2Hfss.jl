module create_closed_fractal 
    export Cclosedfractal
    using LaTeXStrings  
    function Cclosedfractal(ProjectName::String, VBSfilePath::String, LineName::String, Geometry::String, Length::Float64, PEC::String, PECnumber::Int64 )
        
        file = open("$(VBSfilePath)\\create_closed_fractal.vbs", "w")
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
            write(file, "\"$(LineName):Move:1\"), Array(\"NAME:ChangedProps\", Array(\"NAME:Move Vector\", \"X:=\", \"-$(Length/2)mm\", \"Y:=\",  _\n")
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
            write(file, "\"$(LineName),$(LineName)1,$(LineName)2,$(LineName)3\"), Array(\"NAME:UniteParameters\", \"KeepOriginals:=\",  _\n")
            write(file, "false, \"TurnOnNBodyBoolean:=\", true)\n")
            write(file, "oEditor.CoverLines Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)\", \"NewPartsModelFlag:=\",  _\n")
            write(file, "\"Model\")\n")

        elseif Geometry == "triangle"
            
            write(file, "oEditor.Rotate Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)\", \"NewPartsModelFlag:=\",  _\n")
            write(file, "\"Model\"), Array(\"NAME:RotateParameters\", \"RotateAxis:=\", \"Z\", \"RotateAngle:=\",  _\n")
            write(file, "\"-60deg\")\n")
            write(file, "oEditor.Copy Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)\")\n")
            write(file, "oEditor.Paste\n")
            write(file, "oEditor.Mirror Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)1\", \"NewPartsModelFlag:=\",  _\n")
            write(file, "\"Model\"), Array(\"NAME:MirrorParameters\", \"MirrorBaseX:=\", \"0mm\", \"MirrorBaseY:=\",  _\n")
            write(file, "\"-0.2mm\", \"MirrorBaseZ:=\", \"0mm\", \"MirrorNormalX:=\", \"-$(Length)mm\", \"MirrorNormalY:=\",  _\n") #Base olayına dikkat et.
            write(file, "\"0mm\", \"MirrorNormalZ:=\", \"0mm\")\n")
            write(file, "Set oEditor = oDesign.SetActiveEditor(\"3D Modeler\")\n")
            write(file, "oEditor.Copy Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)\")\n")
            write(file, "oEditor.Paste\n")
            write(file, "oEditor.Rotate Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)2\", \"NewPartsModelFlag:=\",  _\n")
            write(file, "\"Model\"), Array(\"NAME:RotateParameters\", \"RotateAxis:=\", \"Z\", \"RotateAngle:=\",  _\n")
            write(file, "\"60deg\")\n")
            write(file, "oEditor.Mirror Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)2\", \"NewPartsModelFlag:=\",  _\n")
            write(file, "\"Model\"), Array(\"NAME:MirrorParameters\", \"MirrorBaseX:=\", \"0.5mm\", \"MirrorBaseY:=\",  _\n") #Base olayına dikkat et.
            write(file, "\"0mm\", \"MirrorBaseZ:=\", \"0mm\", \"MirrorNormalX:=\", \"0mm\", \"MirrorNormalY:=\",  _\n")
            write(file, "\"-$(Length)mm\", \"MirrorNormalZ:=\", \"0mm\")\n")
            write(file, "oEditor.Move Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)2\", \"NewPartsModelFlag:=\",  _\n")
            write(file, "\"Model\"), Array(\"NAME:TranslateParameters\", \"TranslateVectorX:=\", \"-$(Length/2)mm\", \"TranslateVectorY:=\",  _\n")
            write(file, "\"(-(sqrt(3) * $(Length))/2) mm\", \"TranslateVectorZ:=\", \"0mm\")\n")
            write(file, "Set oEditor = oDesign.SetActiveEditor(\"3D Modeler\")\n")
            write(file, "oEditor.Unite Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName),$(LineName)1,$(LineName)2\"), Array(\"NAME:UniteParameters\", \"KeepOriginals:=\",  _\n")
            write(file, "false, \"TurnOnNBodyBoolean:=\", true)\n")
            write(file, "oEditor.CoverLines Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)\", \"NewPartsModelFlag:=\",  _\n")
            write(file, "\"Model\")\n")
            write(file, "oEditor.Move Array(\"NAME:Selections\", \"Selections:=\", \"$(LineName)\", \"NewPartsModelFlag:=\",  _\n")
            write(file, "\"Model\"), Array(\"NAME:TranslateParameters\", \"TranslateVectorX:=\", \"0mm\", \"TranslateVectorY:=\",  _\n")
            write(file, "\"((sqrt(3) * $(Length))/3) mm\", \"TranslateVectorZ:=\", \"0mm\")\n")

        elseif Geometry == "rectangle"
        
        else println("Geometry Options:\n-square\n-triangle\n-rectangle");     
        end
        if PEC == "yes"
            write(file, "Set oModule = oDesign.GetModule(\"BoundarySetup\")\n")
            write(file, "oModule.AssignPerfectE Array(\"NAME:PerfE$(PECnumber)\", \"Objects:=\", Array(\"$(LineName)\"), _\n")
            write(file, "\"InfGroundPlane:=\", false)\n")
        end

        close(file)

    end
end