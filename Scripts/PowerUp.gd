extends Node3D
class_name PowerUp

## Reference to the player
var player : PlayerCar = null

@onready var label : Label3D = $Label3D
 
## Most powerups will add or multiply something onto the player,
## see if this one can be used before adding more variable
@export var boost : float = 100.0

## Boost should be between min and max size
## These are used to determine the powerups size
## The closer Boost is to min_size the smaller it will be
## Closer to max_size means bigger
@export var min_size : float = 50
@export var max_size : float = 200

## Mesh is scaled with boost
@onready var mesh : Node3D = $Mesh

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
	
	var y : float = inverse_lerp(min_size, max_size, boost) + 1 * 2
	
	
	
	#print(y)
	
	mesh.global_scale(Vector3(y,y,y))
	
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
