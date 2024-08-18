extends PowerUp

var up := false

func effect():
	player.fuelComp.Fuel(boost, true)
