extends PowerUp


@export var boost_time := 5

func effect():
	player.Boost(boost, boost_time)
