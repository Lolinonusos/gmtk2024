extends PowerUp

@export var speed_boost := 8.0
@export var boost_time := 5

func effect():
	player.boost(speed_boost, boost_time)
