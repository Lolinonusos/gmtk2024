extends Node3D

## Reference to the player
## Needed to deal damage to the obstacle or end the game when playeris unable to destroy it
var player : PlayerCar = null

## Destroyed when 0
@export var health : float = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hit():
	health -= player.damage_dealt
	
	if health <= 0:
		queue_free()
	print(health)

func _on_area_3d_body_entered(body):
	if body is PlayerCar:
		player = body
		hit()
