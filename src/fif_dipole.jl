using FractalTools
using Plots
using LaTeXStrings

x = [0, 5, 10, 15, 20.0]
y = [0, 10, 0, -10, 0.0]
pts = collect.(zip(x, y))

for s = 0.1:0.1:1
    for N = 1:10
        interp = interpolate(pts, Interp1D(s); niter=N)
        xt = collect(0:0.01:20)
        length(xt)
        yt = interp.(xt)
        plot(xt, yt, legend=false, linewidth=3, color=:black, grid=true, xtickfontsize=16, ytickfontsize=16, xguidefontsize=20, yguidefontsize=20, gridlinewidth=2, gridalpha=0.2)
        scatter!(x, y, marker=:o, markersize=5, color=:red)

        ## HFSS script ##

        # file = "hfssScriptFile.vbs"
        file = open("hfssScriptFile_wiredipole_p2000_d$(s)_iter_$(N).vbs", "w")
        write(file, "Dim oHfssApp\n")
        write(file, "Dim oDesktop\n")
        write(file, "Dim oProject\n")
        write(file, "Dim oDesign\n")
        write(file, "Dim oEditor\n")
        write(file, "Dim oModule\n")
        write(file, "Set oHfssApp = CreateObject (\"AnsoftHfss.HfssScriptInterface\")\n")
        write(file, "Set oDesktop = oHfssApp.GetAppDesktop()\n")
        write(file, "oDesktop.RestoreWindow\n")
        write(file, "oDesktop.NewProject\n")
        write(file, "Set oProject = oDesktop.GetActiveProject\n")
        write(file, "oProject.InsertDesign \"HFSS\", \"design1\", \"DrivenModal\", \"\"\n")
        write(file, "Set oDesign = oProject.SetActiveDesign(\"design1\")\n")
        write(file, "Set oEditor = oDesign.SetActiveEditor(\"3D Modeler\")\n")
        write(file, "Set oModule = oDesign.GetModule(\"BoundarySetup\")\n")

        for i = 1:length(xt)-1
            write(file, "oEditor.CreatePolyline Array(\"NAME:PolylineParameters\",\"IsPolylineCovered:=\", true, \"IsPolylineClosed:=\",false, _\n")
            write(file, "Array(\"NAME:PolylinePoints\", Array(\"NAME:PLPoint\", _\n")
            write(file, "\"X:=\", \"$(xt[i])mm\",_\n")
            write(file, "\"Y:=\", \"$(yt[i])mm\" ,_\n")
            write(file, "\"Z:=\",\"0mm\"), _\n")
            write(file, "Array(\"NAME:PLPoint\", _\n")
            write(file, "\"X:=\", \"$(xt[i+1])mm\",_\n")
            write(file, "\"Y:=\", \"$(yt[i+1])mm\",_\n")
            write(file, "\"Z:=\", \"0mm\")), _\n")

            write(file, "Array(\"NAME:PolylineSegments\", Array(\"NAME:PLSegment\",\"SegmentType:=\",_\n")
            write(file, "\"Line\", \"StartIndex:=\", 0, \"NoOfPoints:=\", 2)), _\n")
            write(file, "Array(\"NAME:PolylineXSection\", \"XSectionType:=\", _\n")
            write(file, "\"None\", \"XSectionOrient:=\", \"Auto\", \"XSectionWidth:=\", \"0mm\",\"XSectionHeight:=\", _\n")
            write(file, "\"0mm\", \"XSectionNumSegments:=\", \"0\", \"XSectionBendType:=\", \"Corner\")), Array(\"NAME:Attributes\", \"Name:=\", _\n")
            write(file, "\"Polyline1\", \"Flags:=\", \"\", \"Color:=\", \"(132 132 193)\", \"Transparency:=\", 0, \"PartCoordinateSystem:=\", _\n")
            write(file, "\"Global\", \"MaterialValue:=\", \"\" & Chr(34) & \"vacuum\" & Chr(34) & \"\", \"SolveInside:=\",true) _\n")

            write(file, "\n")

        end

        close(file)
    end
end