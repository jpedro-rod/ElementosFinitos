
lcl = 0.002; // parede lateral
lci = 0.002; // entrada inferior
lcs = 0.0001; // saida superior
le = 0.0001; // elipse
//+
Point(1) = {0, 0, 0, lci};
Point(2) = {0.0205, 0, 0, lci};
Point(3) = {0.0205, 0.011, 0, lcs};
Point(4) = {0, 0.011, 0, lcs};
//+
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
//+
Curve Loop(1) = {3, 4, 1, 2};

xc = 0.0035; // x centro da 1a. elipse
yc = 0.0035; // y centro da 1a. elipse
rh = 0.0005; // raio horizontal
rv = 0.0005; // raio vertical
kh = 0.0015; // permeabilidade horizontal
kv = 0.0015; // permeabilidade vertical
nh = 10; // total de obstaculos horizontais
nv = 5; // total de obstaculos verticais

// elipses horizontais (nh) e verticais (nv)
count=0;counte=0;countl=2;
For h In {0:nh-1}
 For v In {0:nv-1}
  //+
  Point(5+count) = {   xc+kh*(h),    yc+kv*(v), 0, le};  // centro da elipse
  Point(6+count) = {xc+rh+kh*(h),    yc+kv*(v), 0, le};  // direita da elipse
  Point(7+count) = {   xc+kh*(h), yc+rv+kv*(v), 0, le};  // cima da elipse
  Point(8+count) = {xc-rh+kh*(h),    yc+kv*(v), 0, le};  // esquerda da elipse
  Point(9+count) = {   xc+kh*(h), yc-rv+kv*(v), 0, le};  // baixo da elipse

  //+
  Ellipse(5+(counte)) = {7+count, 5+count, 5+count, 6+count}; // Faz arco eliptico com dois pontos e um centro
  Ellipse(6+(counte)) = {6+count, 5+count, 5+count, 9+count};
  Ellipse(7+(counte)) = {9+count, 5+count, 5+count, 8+count};
  Ellipse(8+(counte)) = {8+count, 5+count, 5+count, 7+count};

  Curve Loop(countl) = {8+counte, 5+counte, 6+counte, 7+counte};
  count+=5;counte+=4;countl+=1;
 EndFor
EndFor

Plane Surface(1) = {1:nh*nv+1};

//+
Physical Line("inferior", 1) = {1};
Physical Line("superior", 2) = {3};
Physical Line("esquerda", 3) = {4};
Physical Line("direita", 4) = {2};
Physical Line("obstaculo1",5) = {5+0*nh*4:1*nh*4+4};
Physical Line("obstaculo2",6) = {5+1*nh*4:2*nh*4+4};
Physical Line("obstaculo3",7) = {5+2*nh*4:3*nh*4+4};
Physical Line("obstaculo4",8) = {5+3*nh*4:4*nh*4+4};
Physical Line("obstaculo5",9) = {5+4*nh*4:5*nh*4+4};
Physical Line("obstaculo6",9) = {5+5*nh*4:6*nh*4+4};
Physical Line("obstaculo7",10) = {5+6*nh*4:7*nh*4+4};
Physical Line("obstaculo8",11) = {5+7*nh*4:8*nh*4+4};
Physical Line("obstaculo9",12) = {5+8*nh*4:9*nh*4+4};
Physical Line("obstaculo10",13) = {5+9*nh*4:10*nh*4+4};
Physical Surface("surface") = {1};
