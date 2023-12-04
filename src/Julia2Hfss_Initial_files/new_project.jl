module new_project 
    export newproject
    using LaTeXStrings

    function newproject(ProjectName::String, PackagePath::String)
    
        file = open("$(PackagePath)\\Julia2Hfss.jl\\src\\Julia2Hfss_Initial_files\\new_project.vbs", "w")
        write(file, "Dim oAnsoftApp\n")
        write(file, "Dim oDesktop\n")
        write(file, "Dim oProject\n")
        write(file, "Dim oDesign\n")
        write(file, "Dim oEditor\n")
        write(file, "Dim oModule\n")
        write(file, "Dim oProjects\n")
        write(file, "Dim omachine\n")
        write(file, "Set oAnsoftApp = CreateObject(\"AnsoftHfss.HfssScriptInterface\")\n")
        write(file, "Set oDesktop = oAnsoftApp.GetAppDesktop()\n")
        write(file, "oDesktop.RestoreWindow\n")
        write(file, "Set oProject = oDesktop.NewProject\n")
        write(file, "oProject.SaveAs \"$(PackagePath)\\Julia2Hfss.jl\\HfssProjects\\$(ProjectName).aedt\", true, \"ef_make_path_absolute\"\n")
        close(file)
    end
end