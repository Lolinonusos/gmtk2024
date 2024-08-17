extends Control

var fuelBar : Slider
var playerFuel : FuelComponent

func _ready() -> void:
	fuelBar = $FuelBar
	playerFuel = get_tree().get_first_node_in_group("player").fuelComp
	var fuelValue =  (playerFuel.fuel * 100) / playerFuel.MAX_FUEL
	fuelBar.value = fuelValue
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var fuelValue = (playerFuel.fuel * 100) / playerFuel.MAX_FUEL
	fuelBar.value = fuelValue
