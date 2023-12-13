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
oEditor.CreateBox Array("NAME:BoxParameters", "XPosition:=", "-50mm", "YPosition:=",  _
"-40mm", "ZPosition:=", "0mm", "XSize:=", "130mm", "YSize:=", "130mm", "ZSize:=",  _
"50mm"), Array("NAME:Attributes", "Name:=", "Box1", "Flags:=", "", "Color:=",  _
"(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
"", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SurfaceMaterialValue:=",  _
"" & Chr(34) & "" & Chr(34) & "", "SolveInside:=", true, "ShellElement:=",  _
false, "ShellElementThickness:=", "0mm", "ReferenceTemperature:=", "20cel", "IsMaterialEditable:=",  _
true, "UseMaterialAppearance:=", false, "IsLightweight:=", false)
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
"Box1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "MertBox"), Array("NAME:Material", "Value:=",  _
"" & Chr(34) & "FR4_epoxy" & Chr(34) & ""), Array("NAME:Transparent", "Value:=", 0))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DCmdTab", Array("NAME:PropServers",  _
"MertBox:CreateBox:1"), Array("NAME:ChangedProps", Array("NAME:Position", "X:=", "-2.5mm", "Y:=",  _
"-3.5mm", "Z:=", "0.0mm"), Array("NAME:XSize", "Value:=", "5.0mm"), Array("NAME:YSize", "Value:=",  _
"7.0mm"), Array("NAME:ZSize", "Value:=", "0.8mm"))))
