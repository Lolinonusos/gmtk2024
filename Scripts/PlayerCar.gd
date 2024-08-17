extends VehicleBody3D

@export var fuelUsage := 0.1

var fuelComp : FuelComponent

var max_rpm = 500
var max_torque = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	fuelComp = $FuelComponent

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("RIGHT", "LEFT") * 0.4, 5 * delta)
	var drive = Input.get_axis("DOWN", "UP")
	if engine_force:
		fuelComp.Fuel(fuelUsage, false)
	
	engine_force = drive * 100

func _unhandled_input(event):
	# Close game
	if event.is_action_pressed("EXIT"):
		get_tree().quit()
