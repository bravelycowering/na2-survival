#click
setsplit click.coords " "
if click.button|=|"Left" jump #mine {click.coords[0]}|{click.coords[1]}|{click.coords[2]}
if click.button|=|"Right" jump #place {click.coords[0]}|{click.coords[1]}|{click.coords[2]}
quit

#mine
tempblock 0 runArg1 runArg2 runArg3
quit

#place
if click.face|=|"AwayX" setsub runArg1 1
if click.face|=|"AwayY" setsub runArg2 1
if click.face|=|"AwayZ" setsub runArg3 1
if click.face|=|"TowardsX" setadd runArg1 1
if click.face|=|"TowardsY" setadd runArg2 1
if click.face|=|"TowardsZ" setadd runArg3 1
tempblock 1 runArg1 runArg2 runArg3
quit

#onJoin
msg Starting setup
clickevent sync register #click
quit