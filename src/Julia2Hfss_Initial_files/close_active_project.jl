module close_active_project 
    export closeproject
    using LaTeXStrings

    function closeproject(ProjectName::String, PackagePath::String)
    
        file = open("$(PackagePath)\\Julia2Hfss.jl\\src\\Julia2Hfss_Initial_files\\close_active_project.vbs", "w")
        write(file, "Dim oAnsoftApp\n")
        write(file, "Dim oDesktop\n")
        write(file, "Dim oProject\n")
        write(file, "Dim oDesign\n")
        write(file, "Dim oEditor\n")
        write(file, "Dim oModule\n")
        write(file, "Set oAnsoftApp = CreateObject(\"AnsoftHfss.HfssScriptInterface\")\n")
        write(file, "Set oDesktop = oAnsoftApp.GetAppDesktop()\n")
        write(file, "oDesktop.CloseProject \"$(ProjectName)\"\n")
        close(file)
    end
end