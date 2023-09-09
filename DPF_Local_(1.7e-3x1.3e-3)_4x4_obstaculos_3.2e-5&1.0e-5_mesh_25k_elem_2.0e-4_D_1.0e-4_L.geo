lci = 0.000040; // quinas inferiores, 8x4
lcs = 0.000040;// quinas superiores, 8x4
le  = 0.0000125; // elipse, 8x1.25

rh = 0.00010; // raio horizontal
rv = 0.00010; // raio vertical
Dh = 2*rh; Dv = 2*rv;
kh = 3*rh; // permeabilidade horizontal
kv = 3*rv; // permeabilidade vertical
xc = 4*rh; // x centro da 1a. elipse
yc = 2*rv; // y centro da 1a. elipse

nh = 4; // total de obstaculos horizontais
nv = 4; // total de obstaculos verticais

Lx = 2*xc + (nh-1)*kh; // comprimento da malha
Ly = yc + (nv-1)*kv + Dv; // largura da malha
//+
Point(1) = {         0,  0, 0, lci};
Point(2) = {        Lx,  0, 0, lci};
Point(3) = {        Lx, Ly, 0, lcs};
Point(4) = {Lx-xc+2*rh, Ly, 0, le };
Point(5) = {   xc-2*rh, Ly, 0, le };
Point(6) = {         0, Ly, 0, lcs};
//+
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};

Curve Loop(1) = {3, 4, 5, 6, 1, 2};

// elipses horizontais (nh) e verticais (nv)
count=0;counte=0;countl=2;
For h In {0:nh-1}
 For v In {0:nv-1}
  //+
  Point(7+count)  = {   xc+kh*(h),    yc+kv*(v), 0, le};  // centro da elipse
  Point(8+count)  = {xc+rh+kh*(h),    yc+kv*(v), 0, le};  // direita da elipse
  Point(9+count)  = {   xc+kh*(h), yc+rv+kv*(v), 0, le};  // cima da elipse
  Point(10+count) = {xc-rh+kh*(h),    yc+kv*(v), 0, le};  // esquerda da elipse
  Point(11+count) = {   xc+kh*(h), yc-rv+kv*(v), 0, le};  // baixo da elipse

  //+
  Ellipse(7+(counte))  = {9+count, 7+count, 7+count, 8+count}; // Faz arco eliptico com dois pontos e um centro
  Ellipse(8+(counte))  = {8+count, 7+count, 7+count, 11+count};
  Ellipse(9+(counte))  = {11+count, 7+count, 7+count, 10+count};
  Ellipse(10+(counte)) = {10+count, 7+count, 7+count, 9+count};

  Curve Loop(countl) = {10+counte, 7+counte, 8+counte, 9+counte};
  count+=5;counte+=4;countl+=1;
 EndFor
EndFor

Plane Surface(1) = {1:countl-1};

//+
Physical Line("inferior", 1)  = {1};
Physical Line("superior", 2)  = {3,4,5};
Physical Line("esquerda", 3)  = {6};
Physical Line("direita", 4)   = {2};
Physical Line("obstaculo1", 5) = {7+0*nv*4:1*nv*4+6};
Physical Line("obstaculo2", 6) = {7+1*nv*4:2*nv*4+6};
Physical Line("obstaculo3", 7) = {7+2*nv*4:3*nv*4+6};
Physical Line("obstaculo4", 8) = {7+3*nv*4:4*nv*4+6};
Physical Surface("surface") = {1};