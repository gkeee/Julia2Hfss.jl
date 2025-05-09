module open_project 
    export openproject
    using LaTeXStrings

    function openproject(ProjectName::String, ProjectPath::String, VBSfilePath::String)
    
        file = open("$(VBSfilePath)\\Julia2Hfss.jl\\src\\Functions\\open_project.vbs", "w")
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
        write(file, "oDesktop.OpenProject  \"$(ProjectPath)\\$(ProjectName).aedt\"\n")
        close(file)
    end
end