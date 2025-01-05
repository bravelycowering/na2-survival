#click
set coords {click.coords}
setsplit coords " "
if click.button|=|"Left" jump #mine {coords[0]}|{coords[1]}|{coords[2]}
if click.button|=|"Right" jump #place {coords[0]}|{coords[1]}|{coords[2]}
quit

#mine
set x {runArg1}
set y {runArg2}
set z {runArg3}
tempblock 0 {x} {y} {z}
quit

#place
set x {runArg1}
set y {runArg2}
set z {runArg3}
if click.face|=|"AwayX" setsub x 1
if click.face|=|"AwayY" setsub y 1
if click.face|=|"AwayZ" setsub z 1
if click.face|=|"TowardsX" setadd x 1
if click.face|=|"TowardsY" setadd y 1
if click.face|=|"TowardsZ" setadd z 1
tempblock 1 {x} {y} {z}
quit

#onJoin
msg Starting setup
clickevent sync register #click
quit