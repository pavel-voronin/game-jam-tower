extends Control

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and (event as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT:
		get_tree().change_scene_to_file("res://scenes/game.tscn")

