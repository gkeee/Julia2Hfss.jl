Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Dim oProjects
Dim omachine
Set oAnsoftApp = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oAnsoftApp.GetAppDesktop()
oDesktop.RestoreWindow
Set oProject = oDesktop.NewProject
oProject.SaveAs "D:\other\JuliaWorks\Julia2Hfss.jl\src\Julia2Hfss_Initial_files\merttamer.aedt", true, "ef_make_path_absolute"