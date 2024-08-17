extends VehicleBody3D
class_name PlayerCar

@export var fuelUsage := 0.1
@export var base_damage : float = 10.0

var damage_dealt : float = 0.0
var fuelComp : FuelComponent
var speedMult := 1.0
var boostTime := 0.0

#var max_rpm = 500
#var max_torque = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	fuelComp = $FuelComponent

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("RIGHT", "LEFT") * 0.4, 5 * delta)
	var drive = Input.get_axis("DOWN", "UP")
	if engine_force:
		fuelComp.Fuel(fuelUsage, false)
	
	engine_force = (drive * 100) * speedMult
	if Input.is_action_pressed("BOOST") and fuelComp.fuel > 0.0 and drive:
		engine_force = engine_force * 1.5
		fuelComp.Fuel(fuelUsage, false)
		
	elif Input.is_action_pressed("BOOST") and !fuelComp.fuel:
		print("No fuel x3")
	#print(engine_force) 
	
	
	
	damage_dealt = base_damage * (linear_velocity.length() * 0.1)
	#print(damage_dealt) 
	
	 
	#print(linear_velocity)
	
	if boostTime > 0:
		boostTime -= delta
	else:
		speedMult = 1

func _unhandled_input(event):
	# Close game
	
	if event.is_action_pressed("EXIT"):
		get_tree().quit()
	

func boost(boostMulti : float, boostDuration : float):
	speedMult = boostMulti
	boostTime += boostDuration
	
