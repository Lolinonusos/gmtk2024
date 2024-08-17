extends Node2D
class_name FuelComponent

## Public Variables
@export var MAX_FUEL := 100.0

## Private Variables
var fuel : float

func _ready() -> void:
	fuel = MAX_FUEL

func Fuel(amount:float, add : bool):
	if add:
		fuel += amount
	else:
		fuel -= amount
	
	if fuel <= 0:
		fuel = 0
	elif fuel > MAX_FUEL:
		fuel = MAX_FUEL
	
	#print(fuel)
