// Gmsh project created on Tue Jan 17 22:59:59 2023
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0.0, 0, 0.008};
//+
Point(2) = {0.6, 0, 0, 0.008};
//+
Point(3) = {0.6, 0.1, 0, 0.008};
//+
Point(4) = {0, 0.1, 0, 0.008};
//+
Line(1) = {4, 1};
//+
Line(2) = {1, 2};
//+
Line(3) = {2, 3};
//+
Line(4) = {3, 4};
//+
Circle(5) = {0.16, 0.0333, 0, 0.015, 0, 2*Pi};
//+
Circle(6) = {0.32, 0.0667, 0, 0.015, 0, 2*Pi};
//+
Circle(7) = {0.48, 0.0333, 0, 0.015, 0, 2*Pi};
//+
Curve Loop(1) = {4, 1, 2, 3};
//+
Curve Loop(2) = {5};
//+
Curve Loop(3) = {6};
//+
Curve Loop(4) = {7};
//+
Point(8) = {0.160, 0.0183, 0, 0.005};
//+
Point(9) = {0.160, 0.0483, 0, 0.005};
//+
Point(10) = {0.145, 0.0333, 0, 0.005};
//+
Point(11) = {0.175, 0.0333, 0, 0.005};
//+
Point(12) = {0.320, 0.0817, 0, 0.005};
//+
Point(13) = {0.320, 0.0517, 0, 0.005};
//+
Point(14) = {0.305, 0.0667, 0, 0.005};
//+
Point(15) = {0.335, 0.0667, 0, 0.005};
//+
Point(16) = {0.480, 0.0183, 0, 0.005};
//+
Point(17) = {0.480, 0.0483, 0, 0.005};
//+
Point(18) = {0.465, 0.0333, 0, 0.005};
//+
Point(19) = {0.495, 0.0333, 0, 0.005};
//+
Point(20) = {0.32, 0.1, 0, 0.005};
//+
Point(21) = {0.16, 0, 0, 0.005};
//+
Point(22) = {0.48, 0, 0, 0.005};
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

