extends Node3D
class_name PowerUp

# Reference to the player
var player : PlayerCar = null

@onready var label : Label3D = $Label3D
#@onready var label : Label = $Label
## Most powerups will add or multiply something onto the player,
## see if this one can be used before adding more variable
@export var boost : float = 100.0

# Floating up and down animation
var bouncetime : float

# Called when the node enters the scene tree for the first time.
func _ready():
	label.billboard = 1
	label.font_size = 200
	label.no_depth_test = true
	label.render_priority = 1
	if boost >= 0:
		label.set_text("+%d" %boost)
	else:
		label.set_text("-%d" %boost)
		
	return

func _process(delta: float) -> void:
	## Rotate item
	rotate_y(0.1)
	
	## Up and down movement
	bouncetime += delta
	var bounce = sin(bouncetime * 5) * 0.05
	position.y += bounce
	

func effect():
	return

func _on_area_3d_body_entered(body):
	if body is PlayerCar:
		player = body
		effect()
		_be_collected()
	

func _be_collected() -> void:
	queue_free()
