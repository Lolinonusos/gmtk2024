extends Control
class_name win_lose

func Win():
	$Win.set_deferred("visible", true)

func Lose():
	$Lose.set_deferred("visible", true)
	


# Both buttons do the same thing so it's the same function
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Main.tscn")
