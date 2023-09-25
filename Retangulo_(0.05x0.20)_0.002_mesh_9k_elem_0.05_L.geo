// Gmsh project created on Tue Jan 17 00:38:31 2023

ms = 0.002; // mesh size

Point(1) = {0, 0, 0, ms};
Point(2) = {0.20, 0, 0, ms};
Point(3) = {0.20, 0.05, 0, ms};
Point(4) = {0, 0.05, 0, ms};
//+
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Curve Loop(1) = {1,2,3,4};
//+
Plane Surface(1) = {1};
//+
Physical Line("Admissao", 1) = {4};
Physical Line("CCInferior", 2) = {1};
Physical Line("Exaustao", 3) = {2};
Physical Line("CCSuperior", 4) = {3};
Physical Surface("Fluido") = {1};
//+
// Outra forma de definir dimensão dos elementos: MeshSize {4, 1, 2, 3} = 0.002;