Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Set oAnsoftApp = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oProject = oDesktop.SetActiveProject ("merttamer2")
oProject.SaveAs "D:\other\JuliaWorks\Julia2Hfss.jl\HfssProjects\merttamer2.aedt", true, " "
oDesktop.CloseProject "merttamer2"
