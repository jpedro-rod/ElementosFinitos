// Gmsh project created on Tue Jan 17 00:38:31 2023
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0};
//+
Point(2) = {2, 0, 0};
//+
Point(3) = {2, 1, 0};
//+
Point(4) = {0, 1, 0};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 1};
//+
Curve Loop(1) = {3, 4, 1, 2};
//+
Plane Surface(1) = {1};
//+
Physical Curve("Admissao", 5) = {4};
//+
Physical Curve("CCInferior", 6) = {1};
//+
Physical Curve("Exaustao", 7) = {2};
//+
Physical Curve("CCSuperior", 8) = {3};
//+
Physical Surface("Fluido", 9) = {1};
//+
MeshSize {4, 1, 2, 3} = 0.05;