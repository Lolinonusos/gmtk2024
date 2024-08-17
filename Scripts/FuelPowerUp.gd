extends PowerUp

@export var fuel_boost : float = 100.0

var up := false

## Overriding function because item already has rotation animation
func _process(delta: float) -> void:
	## Up and down movement
	bouncetime += delta
	var bounce = sin(bouncetime * 5) * 0.05
	position.y += bounce
	

func effect():
	player.fuelComp.Fuel(fuel_boost, true)
