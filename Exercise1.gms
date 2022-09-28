$onText
Laboratorio 3- MOS
Ejercicio 1

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Players' /i1*i7/
    rolePerformance 'Role performance' /BallControl, Shooting, Rebounds, Defense/
    position 'Available positions' /Attack, Center, Defense/;

Table Performance(i, rolePerformance)
    BallControl Shooting Rebounds Defense
i1  3           3        1        3
i2  2           1        3        2
i3  2           3        2        2
i4  1           3        3        1
i5  3           3        3        3
i6  3           1        2        3
i7  3           2        2        1;

Parameter positions(i, position);
positions('i1', 'Attack') = 1;
positions('i2', 'Center') = 1;
positions('i3', 'Attack') = 1;
positions('i3', 'Defense') = 1;
positions('i4', 'Center') = 1;
positions('i4', 'Defense') = 1;
positions('i5', 'Attack') = 1;
positions('i5', 'Defense') = 1;
positions('i6', 'Center') = 1;
positions('i6', 'Defense') = 1;
positions('i7', 'Defense') = 1;
positions('i7', 'Attack') = 1;

Variables
  x(i)      Indicates if said player is chosen.
  z         Objective function;

Binary Variable x;

Equations
targetFunc                  target function
amountPlayers               amount of players
defenseConstraint           Defense position constraint
attackingConstraint         Attacking position constraint
centerConstraint            Center position constraint
ballControlConstraint       Ball control constraint
shootingConstraint          Shooting constraint
reboundsConstraint          Rebounds constraint
player2or3                  Player 2 or 3 chosen;

targetFunc     ..  z =e= sum(i, x(i)*Performance(i, 'Defense'));
amountPlayers .. sum(i, x(i)) =e= 5;
defenseConstraint .. sum(i, x(i)*positions(i, 'Defense')) =g= 4;
attackingConstraint .. sum(i, x(i)*positions(i, 'Attack')) =g= 2;
centerConstraint .. sum(i, x(i)*positions(i, 'Center')) =g= 1;
ballControlConstraint .. sum(i, x(i)*Performance(i, 'BallControl'))/5 =g= 2;
shootingConstraint .. sum(i, x(i)*Performance(i, 'Shooting'))/5 =g= 2;
reboundsConstraint .. sum(i, x(i)*Performance(i, 'Rebounds'))/5 =g= 2;
player2or3 .. x('i2') + x('i3') =e= 1;

Model Exercise1 /all/ ;
option mip=cplex
Solve Exercise1 using mip maximizing z;
Display x.l, z.l;

