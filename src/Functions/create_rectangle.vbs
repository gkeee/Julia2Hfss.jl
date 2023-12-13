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
"XStart:=", "-5.0", "YStart:=", "-7.0", "ZStart:=", "2.0", _
"Width:=", "10.0", "Height:=", "14.0", "WhichAxis:=", "z"), _
Array("NAME:Attributes", "Name:=", "Ground", "Flags:=", "Perfect E" , "Color:=", _
 "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", _
 "Global", "UDMId:=", "", _
"MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & _
"", "SolveInside:=",  true)
