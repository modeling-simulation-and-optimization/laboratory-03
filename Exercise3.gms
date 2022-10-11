$onText
Laboratorio 3- MOS
Ejercicio 3

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Songs' /i1*i8/
     genre 'Song genres' /BluesRock, RockAndRoll/;
     
Parameter songGenres(i, genre);
songGenres('i1', 'BluesRock') = 1;
songGenres('i2', 'RockAndRoll') = 1;
songGenres('i3', 'BluesRock') = 1;
songGenres('i4', 'RockAndRoll') = 1;
songGenres('i5', 'BluesRock') = 1;
songGenres('i6', 'RockAndRoll') = 1;
songGenres('i8', 'RockAndRoll') = 1;
songGenres('i8', 'BluesRock') = 1;

Parameter duration(i) 'Song durations' /i1 4, i2 5, i3 3, i4 2, i5 4, i6 3, i7 5, i8 4/;

Variables a(i) 'Song selected (Side A)'
          b(i) 'Song selected (Side B)'
          z    'Target function';

Binary Variables a,b;

Equations targetFunc
          minDurationAMax
          minDurationAMin
          minDurationBMax
          minDurationBMin
          minBluesA
          minBluesB
          minRockNRoll
          conditionalX
          conditionalY;
          
targetFunc      .. z =e= sum(i, a(i)+b(i));
minDurationAMax .. sum(i, a(i)*duration(i)) =g= 14;
minDurationAMin .. sum(i, a(i)*duration(i)) =l= 16;
minDurationBMax .. sum(i, b(i)*duration(i)) =g= 14;
minDurationBMin .. sum(i, b(i)*duration(i)) =l= 14;
minBluesA       .. sum(i, a(i)*songGenres(i,'BluesRock')) =e= 2;
minBluesB       .. sum(i, b(i)*songGenres(i,'BluesRock')) =e= 2;
minRockNRoll    .. sum(i, a(i)*songGenres(i,'RockAndRoll')) =g= 3;
conditionalX    .. 1-a('i1') =g= a('i5');
conditionalY    .. a('i2') + a('i4') =l= b('i1')+1;

Model Exercise3 /all/ ;
option mip=cplex
Solve Exercise3 using mip minimizing z;
Display a.l;
Display b.l;