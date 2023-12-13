Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Set oAnsoftApp = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oAnsoftApp.GetAppDesktop()
oDesktop.RestoreWindow
Set oProject = oDesktop.SetActiveProject("merttamer2")
Set oDesign = oProject.SetActiveDesign("HFSSDesign1")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.CreateRectangle Array("NAME:RectangleParameters", "IsCovered:=", true, _
"XStart:=", "-1.0mm", "YStart:=", "-1.0mm", "ZStart:=", "-0.016mm", _
"Width:=", "2.0mm", "Height:=", "2.0mm", "WhichAxis:=", "z"), _
Array("NAME:Attributes", "Name:=", "Ground", "Flags:=", "" , "Color:=", _
 "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", _
 "Global", "UDMId:=", "", _
"MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & _
"", "SolveInside:=",  true)
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignPerfectE Array("NAME:PerfE2", "Objects:=", Array("Ground"), _
"InfGroundPlane:=", false)
