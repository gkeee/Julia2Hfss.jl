# Julia2Hfss

[![Build Status](https://github.com/gkeee/Julia2Hfss.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/gkeee/Julia2Hfss.jl/actions/workflows/CI.yml?query=branch%3Amain)

The Julia2Hfss Package includes 12 functions until the due date of this report.
These functions can be explained below in order. The unit of numerical inputs is
always in millimeters.

*** closeproject: It closes and saves a project which is previously opened. It accepts
three inputs which are ProjectName: Opened project name as a string variable
in ANSYS HFSS, ProjectPath: Folder Path for the opened project as a string
variable, VBSfilePath: Folder Path to create ”.vbs” file as a string variable.

*** newproject: It creates a new project. It accepts three inputs which are Pro-
jectName: New project name as a string variable in ANSYS HFSS, ProjectPath:
Folder Path for registering new project as a string variable, VBSfilePath: Folder
Path to create ”.vbs” file as a string variable.

*** openproject: It open a already registered project. It accepts three inputs which
are ProjectName: Project name you want to open as a string variable in ANSYS
HFSS, ProjectPath: Folder Path for the project which will open as a string
variable, VBSfilePath: Folder Path to create ”.vbs” file as a string variable.

*** Crectangle: It creates a rectangle in ANSYS HFSS on an already open project.
It accepts 11 inputs which are ProjectName: Project name already opened as
a string variable, VBSfilePath: Folder Path to create the ”.vbs” file as a string
variable, XStart: Start point to draw the rectangle on the x-axis as a Float
variable, YStart: Start point to draw the rectangle on the y-axis as a Float
variable, ZStart: Identify z point value to draw a rectangle and it can be under
zero point at the z-axis as a Float variable, Width: Width of the rectangle on the
x-axis as a Float variable, Height: Height of rectangle on the y-axis as a Float
variable, WhichAxis: Should be written ”z” as a String variable to draw the
rectangle on the x-y plane but rectangle can be drawn on any plane by changing
”z” to ”y” or ”x”, then the definition of width and height is changed, RectName:
Name of drawing rectangle as a String variable, PEC: If a user wants to draw PEC
rectangle, ”yes” should be written as a String variable, otherwise ”no” should be
written as a String variable, PECnumber: If it is PEC, the user must write
number of perfect electric sheets involve drawing rectangle as a Integer variable,
otherwise should be written zero here.

*** Cspline: It draws a Spline in ANSYS HFSS on an already open project. The
significant case is that points cannot be chosen to create an intersection for the
line. It accepts 5 inputs which are ProjectName: Project name already opened
as a string variable, VBSfilePath: Folder Path to create the ”.vbs” file as a string
variable, SplineName: Name of drawing Spline as a String variable, X: X points
as a Vector variable, Y: Y points as a Vector variable at the same size with X
Vector.

*** Clineintsec: It draws discrete lines that can be interested in ANSYS HFSS on
an already open project. Inputs are the same as the Cspline Function.

***  Cline: It draws a line and it can create a closed surface if the start and final points
are the same in ANSYS HFSS on an already open project. The significant case
is that points cannot be chosen to create an intersection for the line. It accepts 9
inputs which are ProjectName: Project name already opened as a string variable,
VBSfilePath: Folder Path to create the ”.vbs” file as a string variable, LineName:
Name of drawing Line as a String variable, IsClosed: ”yes” as a String variable
caused drawing a closed surface, otherwise ”no” as a String variable, X: X points
as a Vector variable, Y: Y points as a Vector variable at the same size with X
Vector, ZStart: Choose z point value to draw a line and it can be under zero
point at the z-axis as a Float variable, PEC: If a user wants to draw PEC surface,
”yes” should be written as a String variable, otherwise ”no” should be written
as a String variable, PECnumber: If it is PEC, the user must write the number
of perfect electric sheets involve drawing surface as an Integer variable, otherwise
should be written zero here.

*** transformfif : It creates new points as a result of the Fractal Interpolation Func-
tion by using the given points. It accepts 4 inputs and returns 2 outputs which
inputs are x: Initial X points as a Vector variable, y: Initial Y points as a Vector
variable, FreeParameter: Free parameter for the IFS transformation as a Float
variable, Niter: Number of iteration for IFS as an Integer variable; outputs are
xt: New X points after transformation as a Vector variable, yt: New Y points
after transformation as a Vector variable.

*** kochfractal: It creates new points as a result of Koch’s Fractal Transformations.
It accepts 3 inputs and returns 2 outputs which inputs are Length: Identify the
length of the no-iteration baseline as a Float variable, Width: Total width of
fractal geometry perpendicular to Length as a Float variable, Niter: Number of
iterations for Koch’s Transformations as an Integer variable; outputs are YY:
New X and Y points after transformations as a Matrix (XVector, YVector) 2xN
variable, N is the point number. The remaining output is the Fixed Points to
control transformations, it is not used to script Koch’s Fractals.

*** Cclosedfractal: After drawing a fractal by using the Cline function, the drawn
fractal converts a surface. It accepts 7 inputs which are ProjectName: Project
name already opened as a string variable, VBSfilePath: Folder Path to create
the ”.vbs” file as a string variable, LineName: Name of drawn Line for fractal
geometry as a String variable, Geometry: Closed Surface is generated with known
shapes ”square”, ”triangle” as a String variable, Length: Length of Fractal Ge-
ometry, PEC: If a user wants to draw PEC surface, written ”yes” as a String
variable, otherwise ”no” as a String variable, PECnumber: If it is PEC, the user
must write the number of perfect electric sheets involve drawing surface as an
Integer variable, otherwise written zero.

*** Cbox: It creates a box in ANSYS HFSS on an already open project. It accepts 9
inputs which are ProjectName: Project name already opened as a string variable,
VBSfilePath: Folder Path to create the ”.vbs” file as a string variable, BoxName:
Name of creating box as a String variable, Transparency: Transparency of the box
as a Float ( From 0.0: Opaque to 1.0: Transparent) variable, Medium: Material
(It must be written as medium names in ANSYS HFSS) of the box as a String
variable, Xsize: Size on the x-axis as a Float variable (The algorithm adjust start
point as minus Xsize over 2), Ysize: Size on the y-axis as a Float variable (The
algorithm adjust start point as minus Ysize over 2), Zsize: Size on the y-axis as
a Float variable, Zstart: The start point for the z-axis, it means height from z=0
point and it can be negative under z=0 point.

*** minkowskifractal: It creates new points as a result of Minkowski’s Fractal
Transformations. It accepts 2 inputs and returns 1 output which inputs are
Length: Identify the length of the no-iteration baseline as a Float variable, Niter:
Number of iterations for Minkowski’s Transformations as an Integer variable;
output is YY: New X and Y points after transformations as a Matrix (XVector,
YVector) 2xN variable, N is the point number.

*** InfGnd: It creates sheet type 2D infinite ground for patch antenna applications.
Several criteria are typed for your design condition and feeding point. It adjusts
the grounding. It accepts 8 inputs which are ProjectName: Project name already
opened as a string variable, VBSfilePath: Folder Path to create the ”.vbs” file as a
string variable, XSize: x Length of the ground as a Float variable, YSize: x Length
of the ground as a Float variable, Transparency: Adjusting the transparency
of the ground as a Float ( From 0.0: Opaque to 1.0: Transparent) variable,
XPosition: This position deals with feed point for x-axis as a Float variable,
YPosition: This position deals with feed point for y-axis as a Float variable,
CoaxRadius: Coax Radius value for Feeding as a Float variable.

*** coaxprobe: It creates a Coaxial port after initializing the InfGnd function. The
port parameters can be added via function inputs. It accepts 8 inputs which are
ProjectName: Project name already opened as a string variable, VBSfilePath:
Folder Path to create the ”.vbs” file as a string variable, XPosition: This position
deals with feed point for x-axis as a Float variable, YPosition: This position deals
with feed point for y-axis as a Float variable, CoaxRadius: Coax Radius value
for Feeding as a Float variable, PinRadius: Pin Radius value (It is touching to
antenna. It should be smaller than Coax Radius.) for Feeding as a Float variable,
CoaxHeight: Height of the coaxial port as a Float variable, SubstrateHeight:
Height of the used Substrate to adjust the feed probe length as a Float variable.
 
*** scale: It creates a scaling to the given object via the object name. The scaling
factor is added to the function with directions. It accepts 6 inputs which are
ProjectName: Project name already opened as a string variable, VBSfilePath:
Folder Path to create the ”.vbs” file as a string variable, ScaledObject: Shows
the scaling object as a string variable, SFx: Scaling Factor in x direction as a
Float variable, SFy: Scaling Factor in y direction as a Float variable, SFz: Scaling
Factor in z direction as a Float variable.






