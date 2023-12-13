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
oEditor.Move Array("NAME:Selections", "Selections:=", "Deneme", "NewPartsModelFlag:=",  _
"Model"), Array("NAME:TranslateParameters", "TranslateVectorX:=", "0mm", "TranslateVectorY:=",  _
"0mm", "TranslateVectorZ:=", "0mm")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DCmdTab", Array("NAME:PropServers",  _
"Deneme:Move:1"), Array("NAME:ChangedProps", Array("NAME:Move Vector", "X:=", "-0.5mm", "Y:=",  _
"0.5mm", "Z:=", "0mm"))))
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.Copy Array("NAME:Selections", "Selections:=", "Deneme")
oEditor.Paste
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Deneme1", "NewPartsModelFlag:=",  _
"Model"), Array("NAME:RotateParameters", "RotateAxis:=", "Z", "RotateAngle:=",  _
"90deg")
oEditor.Copy Array("NAME:Selections", "Selections:=", "Deneme1")
oEditor.Paste
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Deneme2", "NewPartsModelFlag:=",  _
"Model"), Array("NAME:RotateParameters", "RotateAxis:=", "Z", "RotateAngle:=",  _
"90deg")
oEditor.Copy Array("NAME:Selections", "Selections:=", "Deneme2")
oEditor.Paste
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Deneme3", "NewPartsModelFlag:=",  _
"Model"), Array("NAME:RotateParameters", "RotateAxis:=", "Z", "RotateAngle:=",  _
"90deg")
oEditor.Unite Array("NAME:Selections", "Selections:=",  _
"Deneme3,Deneme2,Deneme1,Deneme"), Array("NAME:UniteParameters", "KeepOriginals:=",  _
false, "TurnOnNBodyBoolean:=", true)
oEditor.CoverLines Array("NAME:Selections", "Selections:=", "Deneme3", "NewPartsModelFlag:=",  _
"Model")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignPerfectE Array("NAME:PerfE1", "Objects:=", Array("Deneme3"), _
"InfGroundPlane:=", false)
