lci = 0.0003; // quinas inferiores
lcs = 0.0003; // quinas superiores
le  = 0.0001; // elipse

rh = 0.0005; // raio horizontal
rv = 0.0005; // raio vertical
Dh = 2*rh; Dv = 2*rv;
xc = 3*Dh + rh; // x centro da 1a. elipse
yc = 3*Dv + rv; // y centro da 1a. elipse
kh = 0.0015; // permeabilidade horizontal
kv = 0.0015; // permeabilidade vertical

nh = 4; // total de obstaculos horizontais
nv = 5; // total de obstaculos verticais

Lx = 2*xc + (nh-1)*kh; // comprimento da malha
Ly = yc + (nv-1)*kv + Dv+rv; // largura da malha
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
//+
// O treixo abaixo é para gerar pontos em locais específicos da malha para refiná-la
// Está incompleto. Apenas plota os pontos na geometria e não influencia a malha.
count=0;
For v In {0:nv-1}
 Point(7+count) = {   xc-2*rh, yc+kv*(v), 0, le};  // lateral esquerda
 Point(8+count) = {Lx-xc+2*rh, yc+kv*(v), 0, le};  // lateral direita
 count+=2;
EndFor
indice = 8+(count-1);

count=0;
For h In {0:nh-1}
 Point(indice+count)   = {xc+kh*(h),         yc-2*rv, 0,  le};  // abaixo
 Point(indice+1+count) = {xc+kh*(h), Ly-(Dv+rv)+2*rv, 0, le};  // acima
 count+=2;
EndFor
indice = (indice+1)+(count-1);
//Fim. Caso queira remover, lembre-se de alterar os índices no loop de pontos abaixo.
//+
// elipses horizontais (nh) e verticais (nv)
count=0;counte=0;countl=2;
For h In {0:nh-1}
 For v In {0:nv-1}
  //+
  Point(indice+count)   = {   xc+kh*(h),    yc+kv*(v), 0, le};  // centro da elipse
  Point(indice+1+count) = {xc+rh+kh*(h),    yc+kv*(v), 0, le};  // direita da elipse
  Point(indice+2+count) = {   xc+kh*(h), yc+rv+kv*(v), 0, le};  // cima da elipse
  Point(indice+3+count) = {xc-rh+kh*(h),    yc+kv*(v), 0, le};  // esquerda da elipse
  Point(indice+4+count) = {   xc+kh*(h), yc-rv+kv*(v), 0, le};  // baixo da elipse

  //+
  Ellipse(7+(counte)) = {indice+2+count, indice+count, indice+count, indice+1+count}; // Faz arco eliptico com dois pontos e um centro
  Ellipse(8+(counte)) = {indice+1+count, indice+count, indice+count, indice+4+count};
  Ellipse(9+(counte)) = {indice+4+count, indice+count, indice+count, indice+3+count};
  Ellipse(10+(counte)) = {indice+3+count, indice+count, indice+count, indice+2+count};

  Curve Loop(countl) = {10+counte, 7+counte, 8+counte, 9+counte};
  count+=5;counte+=4;countl+=1;
 EndFor
EndFor

Plane Surface(1) = {1:nh*nv+1};
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