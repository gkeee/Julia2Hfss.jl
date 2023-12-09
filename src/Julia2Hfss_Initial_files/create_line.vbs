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
Array("NAME:PLPoint", "X:=", "0mm", "Y:=", "0mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "1mm", "Y:=", "2mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "2mm", "Y:=", "6mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "3mm", "Y:=", "4mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "4mm", "Y:=", "2mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "5mm", "Y:=", "7mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "6mm", "Y:=", "4mm", "Z:=", "0mm"),  _
Array("NAME:PLPoint", "X:=", "7mm", "Y:=", "7mm", "Z:=", "0mm")),  _
  Array("NAME:PolylineSegments", _
  Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 0, "NoOfPoints:=", 2),  _
  Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 1, "NoOfPoints:=", 2),  _
  Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 2, "NoOfPoints:=", 2),  _
  Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 3, "NoOfPoints:=", 2),  _
  Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 4, "NoOfPoints:=", 2),  _
  Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 5, "NoOfPoints:=", 2),  _
  Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 6, "NoOfPoints:=", 2)  ), _
  Array("NAME:PolylineXSection", "XSectionType:=",  _
  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _
  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _
  "Corner")), Array("NAME:Attributes", "Name:=", "MLine", "Flags:=", "", "Color:=",  _
  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", _
  "SolveInside:=", true)
