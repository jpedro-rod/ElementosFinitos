ref1 = 0.00013;
ref2 = 0.00013;
ref3 = 0.0000026;

//+

rh = 0.000013; // raio horizontal
rv = 0.000013; // raio vertical
Dh = 2*rh; Dv = 2*rv; // diametros
kh = 3*rh; // permeabilidade horizontal
kv = 3*rv; // permeabilidade vertical
xc = 2*rh; // x centro da 1a. elipse
yc = 2*rv; // y centro da 1a. elipse

nh = 40; // total de obstaculos horizontais
nv = 4; // total de obstaculos verticais

Lx = 2*xc + (nh-1)*kh; // comprimento da malha
Ly = 2*yc + (nv-1)*kv; // largura da malha

//+

Point(1) = {-0.0015, -0.0015, 0, ref1};
Point(2) = {0, -0.0015, 0, ref2};
Point(3) = {Lx, -0.0015, 0, ref2};
Point(4) = {Lx, 0, 0, ref3};
Point(5) = {Lx, Ly, 0, ref3};
Point(6) = {Lx + 0.0015, Ly, 0, ref1};
Point(7) = {Lx + 0.0015, Ly + 0.0015, 0, ref1};
Point(8) = {Lx , Ly + 0.0015, 0, ref2};
Point(9) = {0 , Ly + 0.0015, 0, ref2};
Point(10) = {0 , Ly, 0, ref3};
Point(11) = {0 , 0, 0, ref3};
Point(12) = {-0.0015 , 0, 0, ref1};

//+

// contornos
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};  // direita do filtro
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 9};
Line(9) = {9, 10};
Line(10) = {10, 11}; // esquerda do filtro
Line(11) = {11, 12};
Line(12) = {12, 1}; 
// baixo e cima do filtro
Line(13) = {11, 4}; // baixo
Line(14) = {10, 5}; // cima
// Curve Loops (necessarios para criar superficies)
Curve Loop(1) = {1,2,3,-13,11,12};  //-13 pq curva 13 foi feita na direcao contraria do loop
Curve Loop(2) = {5,6,7,8,9,14};
Curve Loop(3) = {4,-14,10,13};

//+

// elipses horizontais (nh) e verticais (nv)
count=0;counte=0;countl=4;
For h In {0:nh-1}
 For v In {0:nv-1}
  //+
  Point(13+count) = {   xc+kh*(h),    yc+kv*(v), 0, ref3};  // centro da elipse
  Point(14+count) = {xc+rh+kh*(h),    yc+kv*(v), 0, ref3};  // direita da elipse
  Point(15+count) = {   xc+kh*(h), yc+rv+kv*(v), 0, ref3};  // cima da elipse
  Point(16+count) = {xc-rh+kh*(h),    yc+kv*(v), 0, ref3};  // esquerda da elipse
  Point(17+count) = {   xc+kh*(h), yc-rv+kv*(v), 0, ref3};  // baixo da elipse
  //+
  Ellipse(15+(counte))  = {15+count, 13+count, 13+count, 14+count}; // Faz arco eliptico com dois pontos e um centro
  Ellipse(16+(counte))  = {14+count, 13+count, 13+count, 17+count};
  Ellipse(17+(counte))  = {17+count, 13+count, 13+count, 16+count};
  Ellipse(18+(counte))  = {16+count, 13+count, 13+count, 15+count};

  Curve Loop(countl) = {18+counte, 15+counte, 16+counte, 17+counte};
  count+=5;counte+=4;countl+=1;
 EndFor
EndFor

//+

Plane Surface(1) = {1}; // admissao
Plane Surface(2) = {2}; // exaustao 
Plane Surface(3) = {3:countl-1}; // filtro

//+

Physical Line("admissao - lado inferior", 1)  = {1,2};
Physical Line("admissao - lado superior", 2)  = {13,11};
Physical Line("admissao - esquerda", 3)  = {12};
Physical Line("admissao - direita", 4)   = {3};
Physical Line("exaustao - lado inferior", 5)  = {14,5};
Physical Line("exaustao - lado superior", 6)  = {7,8};
Physical Line("exaustao - esquerda", 7)  = {9};
Physical Line("exaustao - direita", 8)   = {6};
Physical Line("obstaculo1", 9) = {15+0*nv*4:1*nv*4+14};
Physical Line("obstaculo2", 10) = {15+1*nv*4:2*nv*4+14};
Physical Line("obstaculo3", 11) = {15+2*nv*4:3*nv*4+14};
Physical Line("obstaculo4", 12) = {15+3*nv*4:4*nv*4+14};
Physical Line("obstaculo5", 13) = {15+4*nv*4:5*nv*4+14};
Physical Line("obstaculo6", 14) = {15+5*nv*4:6*nv*4+14};
Physical Line("obstaculo7", 15) = {15+6*nv*4:7*nv*4+14};
Physical Line("obstaculo8", 16) = {15+7*nv*4:8*nv*4+14};
Physical Line("obstaculo9", 17) = {15+8*nv*4:9*nv*4+14};
Physical Line("obstaculo10", 18) = {15+9*nv*4:10*nv*4+14};
Physical Line("obstaculo11", 19) = {15+10*nv*4:11*nv*4+14};
Physical Line("obstaculo12", 20) = {15+11*nv*4:12*nv*4+14};
Physical Line("obstaculo13", 21) = {15+12*nv*4:13*nv*4+14};
Physical Line("obstaculo14", 22) = {15+13*nv*4:14*nv*4+14};
Physical Line("obstaculo15", 24) = {15+14*nv*4:15*nv*4+14};
Physical Line("obstaculo16", 25) = {15+15*nv*4:16*nv*4+14};
Physical Line("obstaculo17", 26) = {15+16*nv*4:17*nv*4+14};
Physical Line("obstaculo18", 27) = {15+17*nv*4:18*nv*4+14};
Physical Line("obstaculo19", 28) = {15+18*nv*4:19*nv*4+14};
Physical Line("obstaculo20", 29) = {15+19*nv*4:20*nv*4+14};
Physical Line("obstaculo21", 30) = {15+20*nv*4:21*nv*4+14};
Physical Line("obstaculo22", 31) = {15+21*nv*4:22*nv*4+14};
Physical Line("obstaculo23", 32) = {15+22*nv*4:23*nv*4+14};
Physical Line("obstaculo24", 33) = {15+23*nv*4:24*nv*4+14};
Physical Line("obstaculo25", 34) = {15+24*nv*4:25*nv*4+14};
Physical Line("obstaculo26", 35) = {15+25*nv*4:26*nv*4+14};
Physical Line("obstaculo27", 36) = {15+26*nv*4:27*nv*4+14};
Physical Line("obstaculo28", 37) = {15+27*nv*4:28*nv*4+14};
Physical Line("obstaculo29", 38) = {15+28*nv*4:29*nv*4+14};
Physical Line("obstaculo30", 39) = {15+29*nv*4:30*nv*4+14};
Physical Line("obstaculo31", 40) = {15+30*nv*4:31*nv*4+14};
Physical Line("obstaculo32", 41) = {15+31*nv*4:32*nv*4+14};
Physical Line("obstaculo33", 42) = {15+32*nv*4:33*nv*4+14};
Physical Line("obstaculo34", 43) = {15+33*nv*4:34*nv*4+14};
Physical Line("obstaculo35", 44) = {15+34*nv*4:35*nv*4+14};
Physical Line("obstaculo36", 45) = {15+35*nv*4:36*nv*4+14};
Physical Line("obstaculo37", 46) = {15+36*nv*4:37*nv*4+14};
Physical Line("obstaculo38", 47) = {15+37*nv*4:38*nv*4+14};
Physical Line("obstaculo39", 48) = {15+38*nv*4:39*nv*4+14};
Physical Line("obstaculo40", 49) = {15+39*nv*4:40*nv*4+14};
Physical Surface("admissao", 1) = {1};
Physical Surface("exaustao", 2) = {2};
Physical Surface("filtro", 3) = {3};