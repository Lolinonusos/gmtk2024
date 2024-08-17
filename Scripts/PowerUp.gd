extends Node3D
class_name PowerUp

var player : PlayerCar = null

var bouncetime : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta: float) -> void:
	## Rotate item
	rotate_y(0.1)
	
	## Up and down movement
	bouncetime += delta
	var bounce = sin(bouncetime * 5) * 0.05
	position.y += bounce
	

func effect():
	pass

func _on_area_3d_body_entered(body):
	if body is PlayerCar:
		player = body
		effect()
		_be_collected()
	

func _be_collected() -> void:
	queue_free()
