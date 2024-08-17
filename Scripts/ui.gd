extends Control

var fuelBar : Slider
var playerFuel : FuelComponent

func _ready() -> void:
	fuelBar = $FuelBar
	
	## get the player's fuel component
	playerFuel = get_tree().get_first_node_in_group("player").fuelComp
	
	## set percentage of fuel
	var fuelValue =  (playerFuel.fuel * 100) / playerFuel.MAX_FUEL
	fuelBar.value = fuelValue
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	## set percentage of fuel left
	var fuelValue = (playerFuel.fuel * 100) / playerFuel.MAX_FUEL
	fuelBar.value = fuelValue
