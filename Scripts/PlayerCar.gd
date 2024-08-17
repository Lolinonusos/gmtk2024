extends VehicleBody3D


var max_rpm = 500
var max_torque = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("ui_right", "ui_left") * 0.4, 5 * delta)
	engine_force = Input.get_axis("ui_down", "ui_up") * 100

func _unhandled_input(event):
	# Close game
	if event.is_action_pressed("EXIT"):
		get_tree().quit()
