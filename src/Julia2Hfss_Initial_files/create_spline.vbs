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
oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false,  _
Array("NAME:PolylinePoints", _
Array("NAME:PLPoint", "X:=", "1mm", "Y:=", "1mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "2mm", "Y:=", "2mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "3mm", "Y:=", "3mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "4mm", "Y:=", "4mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "5mm", "Y:=", "5mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "6mm", "Y:=", "6mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "7mm", "Y:=", "7mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "8mm", "Y:=", "8mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "9mm", "Y:=", "9mm", "Z:=", "0mm")),  _
  Array("NAME:PolylineSegments", Array("NAME:PLSegment", "SegmentType:=",  _
  "Spline", "StartIndex:=", 0, "NoOfPoints:=", 9, "NoOfSegments:=", "0")), Array("NAME:PolylineXSection", "XSectionType:=",  _
  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _
  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _
  "Corner")), Array("NAME:Attributes", "Name:=", "Mertspline", "Flags:=", "", "Color:=",  _
  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SurfaceMaterialValue:=",  _
  "" & Chr(34) & "" & Chr(34) & "", "SolveInside:=", true, "ShellElement:=",  _
  false, "ShellElementThickness:=", "0mm", "ReferenceTemperature:=", "20cel", "IsMaterialEditable:=",  _
  true, "UseMaterialAppearance:=", false, "IsLightweight:=", false)
