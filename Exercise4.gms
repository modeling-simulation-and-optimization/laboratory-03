$onText
Laboratorio 3 - MOS
Ejercicio 4

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets t 'Tile set' /t1*t20/
     p 'Pipe Types' /p1*p7/;
     
Parameter hasPipe(t,p) 'Establishes if said tile has or not a pipe';

hasPipe('t1', 'p1') = 1;
hasPipe('t5', 'p1') = 1;

hasPipe('t5', 'p2') = 1;
hasPipe('t9', 'p2') = 1;

hasPipe('t9', 'p3') = 1;
hasPipe('t10', 'p3') = 1;
hasPipe('t13', 'p3') = 1;
hasPipe('t14', 'p3') = 1;

hasPipe('t13', 'p4') = 1;
hasPipe('t17', 'p4') = 1;

hasPipe('t2', 'p5') = 1;
hasPipe('t3', 'p5') = 1;
hasPipe('t6', 'p5') = 1;
hasPipe('t7', 'p5') = 1;

hasPipe('t10', 'p6') = 1;
hasPipe('t11', 'p6') = 1;
hasPipe('t14', 'p6') = 1;
hasPipe('t15', 'p6') = 1;

hasPipe('t8', 'p7') = 1;
hasPipe('t12', 'p7') = 1;
hasPipe('t16', 'p7') = 1;
hasPipe('t20', 'p7') = 1;
hasPipe('t19', 'p7') = 1;

Variables x(t) 'Node selected'
          z    'Target function';
          
Equations targetFunc  'Target Function'
          minTiles(p) 'Pipe coverage constraint';

targetFunc..  z =e= sum(t, x(t));
minTiles(p).. sum(t, x(t)*hasPipe(t,p)) =g= 1;

Model exercise4 /all/;
option mip=cplex
Solve exercise4 using mip minimizing z;
Display x.l;
Display z.l;
