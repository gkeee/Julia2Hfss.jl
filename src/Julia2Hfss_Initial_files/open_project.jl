module open_project 
    export openproject
    using LaTeXStrings

    function openproject(ProjectName::String, PackagePath::String)
    
        file = open("$(PackagePath)\\Julia2Hfss.jl\\src\\Julia2Hfss_Initial_files\\open_project.vbs", "w")
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
        write(file, "oDesktop.OpenProject  \"$(PackagePath)\\Julia2Hfss.jl\\HfssProjects\\$(ProjectName).aedt\"\n")
        close(file)
    end
end