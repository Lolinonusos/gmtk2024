extends PowerUp

@export var sizeUp := 1.0

func effect():
	player.SizeUp(sizeUp)
