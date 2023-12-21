module close_active_project 
    export closeproject
    using LaTeXStrings

    function closeproject(ProjectName::String, ProjectPath::String, VBSfilePath::String)
    
        file = open("$(VBSfilePath)\\close_active_project.vbs", "w")
        write(file, "Dim oAnsoftApp\n")
        write(file, "Dim oDesktop\n")
        write(file, "Dim oProject\n")
        write(file, "Dim oDesign\n")
        write(file, "Dim oEditor\n")
        write(file, "Dim oModule\n")
        write(file, "Set oAnsoftApp = CreateObject(\"AnsoftHfss.HfssScriptInterface\")\n")
        write(file, "Set oDesktop = oAnsoftApp.GetAppDesktop()\n")
        write(file, "Set oProject = oDesktop.SetActiveProject (\"$(ProjectName)\")\n")
        write(file, "oProject.SaveAs \"$(ProjectPath)\\$(ProjectName).aedt\", true, \" \"\n")
        write(file, "oDesktop.CloseProject \"$(ProjectName)\"\n")
        close(file)
    end
end