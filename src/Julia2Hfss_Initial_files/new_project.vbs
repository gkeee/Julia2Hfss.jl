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
oProject.SaveAs "D:\other\JuliaWorks\Julia2Hfss.jl\HfssProjects\merttamer.aedt", true, "ef_make_path_absolute"