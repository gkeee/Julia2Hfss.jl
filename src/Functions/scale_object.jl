module scale_object
    export scale
    using LaTeXStrings
    function scale(ProjectName::String, VBSfilePath::String, ScaledObject::String, SFx::Float64, SFy::Float64, SFz::Float64)
        file = open("$(VBSfilePath)\\scale_object.vbs", "w")
        write(file, "Dim oAnsoftApp\n")
        write(file, "Dim oDesktop\n")
        write(file, "Dim oProject\n")
        write(file, "Dim oDesign\n")
        write(file, "Dim oEditor\n")
        write(file, "Dim oModule\n")
        write(file, "Set oAnsoftApp = CreateObject(\"Ansoft.ElectronicsDesktop\")\n")
        write(file, "Set oDesktop = oAnsoftApp.GetAppDesktop()\n")
        write(file, "oDesktop.RestoreWindow\n")
        write(file, "Set oProject = oDesktop.SetActiveProject(\"$(ProjectName)\")\n")
        write(file, "Set oDesign = oProject.SetActiveDesign(\"HFSSDesign1\")\n")
        write(file, "Set oEditor = oDesign.SetActiveEditor(\"3D Modeler\")\n")
        write(file, "oEditor.Scale Array(\"NAME:Selections\", \"Selections:=\", \"$(ScaledObject)\", \"NewPartsModelFlag:=\",  _\n")
        write(file, "\"Model\"), Array(\"NAME:ScaleParameters\", \"ScaleX:=\", \"$(SFx)\", \"ScaleY:=\", \"$(SFy)\", \"ScaleZ:=\", \"$(SFz)\")\n")
    end
end