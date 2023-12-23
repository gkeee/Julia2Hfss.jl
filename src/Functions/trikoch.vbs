Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
Set oDesktop = oAnsoftApp.GetAppDesktop()
oDesktop.RestoreWindow
Set oProject = oDesktop.SetActiveProject("merttamer")
Set oDesign = oProject.SetActiveDesign("HFSSDesign1")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.Rotate Array("NAME:Selections", "Selections:=", "KochLine", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:RotateParameters", "RotateAxis:=", "Z", "RotateAngle:=",  _
  "-60deg")
oEditor.Copy Array("NAME:Selections", "Selections:=", "KochLine")
oEditor.Paste
oEditor.Mirror Array("NAME:Selections", "Selections:=", "KochLine1", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:MirrorParameters", "MirrorBaseX:=", "0mm", "MirrorBaseY:=",  _
  "-0.2mm", "MirrorBaseZ:=", "0mm", "MirrorNormalX:=", "-1mm", "MirrorNormalY:=",  _
  "0mm", "MirrorNormalZ:=", "0mm")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.Copy Array("NAME:Selections", "Selections:=", "KochLine")
oEditor.Paste
oEditor.Rotate Array("NAME:Selections", "Selections:=", "KochLine2", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:RotateParameters", "RotateAxis:=", "Z", "RotateAngle:=",  _
  "60deg")
oEditor.Mirror Array("NAME:Selections", "Selections:=", "KochLine2", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:MirrorParameters", "MirrorBaseX:=", "0.5mm", "MirrorBaseY:=",  _
  "0mm", "MirrorBaseZ:=", "0mm", "MirrorNormalX:=", "0mm", "MirrorNormalY:=",  _
  "-1mm", "MirrorNormalZ:=", "0mm")
oEditor.Move Array("NAME:Selections", "Selections:=", "KochLine2", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:TranslateParameters", "TranslateVectorX:=", "-0.5mm", "TranslateVectorY:=",  _
  "(-sqrt(3)/2) mm", "TranslateVectorZ:=", "0mm")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.Unite Array("NAME:Selections", "Selections:=", "KochLine,KochLine1,KochLine2"), Array("NAME:UniteParameters", "KeepOriginals:=",  _
  false, "TurnOnNBodyBoolean:=", true)
oEditor.CoverLines Array("NAME:Selections", "Selections:=", "KochLine", "NewPartsModelFlag:=",  _
  "Model")
oEditor.Move Array("NAME:Selections", "Selections:=", "KochLine", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:TranslateParameters", "TranslateVectorX:=", "0mm", "TranslateVectorY:=",  _
  "(sqrt(3)/3) mm", "TranslateVectorZ:=", "0mm")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignPerfectE Array("NAME:PerfE1", "Objects:=", Array("KochLine"), "InfGroundPlane:=",  _
  false)
