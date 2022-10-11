$onText
Laboratorio 3- MOS
Ejercicio 2

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Towns' /i1*i6/
    alias(i,j);

Parameter distance(i,j) 'Distance between towns';
distance('i1', 'i2') = 10;
distance('i1', 'i3') = 20;
distance('i1', 'i4') = 30;
distance('i1', 'i5') = 30;
distance('i1', 'i6') = 20;

distance('i2', 'i3') = 25;
distance('i2', 'i4') = 35;
distance('i2', 'i5') = 20;
distance('i2', 'i6') = 10;

distance('i3', 'i4') = 15;
distance('i3', 'i5') = 30;
distance('i3', 'i6') = 20;

distance('i4', 'i5') = 15;
distance('i4', 'i6') = 25;

distance('i5', 'i6') = 14;

* Since it's an undirected graph there are bidirectional connections
loop((i,j),
    if (distance(i,j) ne 0,
       distance(j,i) = distance(i,j)
    );
);

loop((i,j),
    if ((distance(i,j) le 15 and distance(i,j) ge 1) or (distance(j,i) le 15 and distance(j,i) ge 1),
       distance(i,j) = 1;
    else
        distance(i,j) = 0;
    );
);

loop((i,j),
    if (distance(i,j) ne 0,
       distance(j,i) = distance(i,j)
    );
);

Display distance;

Variables x(i) 'Node selected'
          z    'Target function';

Binary Variable x;

Equations targetFunc  'Target Function'
          minZones(i);

targetFunc..  z =e= sum(i, x(i));
minZones(i) .. sum(j, x(j)*distance(i,j)) =g=1;

Model Exercise2 /all/ ;
option mip=cplex
Solve Exercise2 using mip minimizing z;
Display x.l;
Display z.l;