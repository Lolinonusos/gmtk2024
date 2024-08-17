extends Node3D
class_name PowerUp

var player : PlayerCar = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func effect():
	pass

func _on_area_3d_body_entered(body):
	if body is PlayerCar:
		player = body
		effect()
		_be_collected()
	

func _be_collected() -> void:
	queue_free()
