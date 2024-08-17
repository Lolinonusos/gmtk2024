extends PowerUp

@export var fuel_boost : float = 100.0

func effect():
	player.fuelComp.Fuel(fuel_boost, true)
