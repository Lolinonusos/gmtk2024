extends VehicleBody3D
class_name PlayerCar

@export var SPEED := 100
@export var fuelUsage := 0.1
@export var base_damage : float = 10.0

var damage_dealt : float = 0.0
var fuelComp : FuelComponent
var speedMult := 1.0
var boostTime := 0.0
var originalinertia 

var powerMulti := 1.0
var scaleUpPickedUp := 0

var winGame : bool

#var max_rpm = 500
#var max_torque = 200

var winlose : win_lose

# Called when the node enters the scene tree for the first time.
func _ready():
	originalinertia = inertia
	fuelComp = $FuelComponent
	winlose = $"../WinLose"

func _physics_process(delta):
	
	rotation_degrees.z = clamp(rotation_degrees.z, -5,5)
	rotation_degrees.x = clamp(rotation_degrees.x, -45,45)
	
	steering = lerp(steering, Input.get_axis("RIGHT", "LEFT") * 0.4, 5 * delta)
	var drive = Input.get_axis("DOWN", "UP")
	if engine_force:
		fuelComp.Fuel(fuelUsage, false)
	
	
	var velocity = linear_velocity.x + linear_velocity.y + linear_velocity.z
	print(velocity)
	if fuelComp.fuel <= 0 and velocity >= -1 and velocity <= 1  and !winGame:
		!winGame
		LoseGame()
	
	if !fuelComp.fuel <= 0: engine_force = (drive * SPEED) * speedMult
	else:                   engine_force = 0
	
	
	if Input.is_action_pressed("BOOST") and fuelComp.fuel > 0.0 and drive:
		engine_force = engine_force * 1.5
		fuelComp.Fuel(fuelUsage, false)
		
	elif Input.is_action_pressed("BOOST") and !fuelComp.fuel:
		print("No fuel x3")
	#print(engine_force) 
	
	
	damage_dealt = (base_damage * (linear_velocity.length() * 0.1)) * powerMulti
	#print(damage_dealt) 
	
	 
	#print(linear_velocity)
	
	if boostTime > 0:
		boostTime -= delta
		rotation_degrees.x = clamp(rotation_degrees.x, -40,20)
		rotation_degrees.y = clamp(rotation_degrees.y, -40,40)
	else:
		speedMult = 1
		inertia = originalinertia

func _unhandled_input(event):
	# Close game
	
	if event.is_action_pressed("EXIT"):
		get_tree().quit()
	

func Boost(boostMulti : float, boostDuration : float):
	inertia = Vector3(110, 1500, 500)
	
	speedMult = boostMulti
	boostTime += boostDuration

func SizeUp(sizeUpValue:float):
	var upsize = sizeUpValue * 0.01
	
	## Scale entire thing more to match scaling with wheels
	$Dumpy.scale += Vector3(upsize*2, upsize*2, upsize*2)
	scale += Vector3(upsize, upsize, upsize)
	
	## Count scale up pickups picked up, might use for camera to zoom out slightly when the car gets bigger idk
	scaleUpPickedUp += 1
	print(scaleUpPickedUp, " upscales has been picked up")
	
	powerMulti += upsize
	
	print(powerMulti)

func LoseGame():
	winlose.Lose()
	print("lost the game")
