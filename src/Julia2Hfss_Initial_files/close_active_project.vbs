Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Set oAnsoftApp = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oProject = oDesktop.SetActiveProject ("merttamer")
oProject.SaveAs "D:\other\JuliaWorks\Julia2Hfss.jl\HfssProjects\merttamer.aedt", true, " "
oDesktop.CloseProject "merttamer"
