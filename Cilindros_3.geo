// Gmsh project created on Tue Jan 17 22:59:59 2023
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0.0, 0, 0.05};
//+
Point(2) = {4, 0, 0, 0.05};
//+
Point(3) = {4, 1, 0, 0.05};
//+
Point(4) = {0, 1, 0, 0.05};
//+
Line(1) = {4, 1};
//+
Line(2) = {1, 2};
//+
Line(3) = {2, 3};
//+
Line(4) = {3, 4};
//+
Circle(5) = {1, 0.333, 0, 0.15, 0, 2*Pi};
//+
Circle(6) = {2, 0.667, 0, 0.15, 0, 2*Pi};
//+
Circle(7) = {3, 0.333, 0, 0.15, 0, 2*Pi};
//+
Curve Loop(1) = {4, 1, 2, 3};
//+
Curve Loop(2) = {5};
//+
Curve Loop(3) = {6};
//+
Curve Loop(4) = {7};
//+
Point(8) = {1, 0.183, 0, 0.05};
//+
Point(9) = {1, 0.483, 0, 0.05};
//+
Point(10) = {0.85, 0.333, 0, 0.05};
//+
Point(11) = {1.15, 0.333, 0, 0.05};
//+
Point(12) = {2, 0.817, 0, 0.05};
//+
Point(13) = {2, 0.517, 0, 0.05};
//+
Point(14) = {1.85, 0.667, 0, 0.05};
//+
Point(15) = {2.15, 0.667, 0, 0.05};
//+
Point(16) = {3, 0.183, 0, 0.05};
//+
Point(17) = {3, 0.483, 0, 0.05};
//+
Point(18) = {2.85, 0.333, 0, 0.05};
//+
Point(19) = {3.15, 0.333, 0, 0.05};
//+
Point(20) = {2, 1, 0, 0.05};
//+
Point(21) = {1, 0, 0, 0.05};
//+
Point(22) = {3, 0, 0, 0.05};
//+
Curve Loop(5) = {4, 1, 2, 3};
//+
Curve Loop(6) = {5};
//+
Curve Loop(7) = {6};
//+
Curve Loop(8) = {7};
//+
Plane Surface(1) = {5, 6, 7, 8};
//+
Physical Curve("Admissao", 9) = {1};
//+
Physical Curve("CCInferior", 10) = {2};
//+
Physical Curve("Exaustao", 11) = {3};
//+
Physical Curve("CCSuperior", 12) = {4};
//+
Physical Curve("cilindro1", 13) = {5};
//+
Physical Curve("cilindro2", 14) = {6};
//+
Physical Curve("cilindro3", 15) = {7};
//+
Physical Surface("fluido", 16) = {1};
//+
MeshSize {10, 5, 8, 9, 12, 14, 6, 13, 17, 18, 7, 16} = 0.05;
//+
//+
MeshSize {12, 13, 6, 14, 9, 5, 10, 8, 18, 17, 7, 16, 22, 21, 20} = 0.05;
//+
MeshSize {9, 12, 6, 14, 13, 5, 8, 10, 17, 7, 18, 16, 22, 21, 20} = 0.03;
