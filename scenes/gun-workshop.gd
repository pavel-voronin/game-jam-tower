extends Panel

var current_mount_point: MointPoint

func _on_close_button_pressed() -> void:
	visible = false

func open(mount_point: MointPoint) -> void:
	current_mount_point = mount_point
	visible = true

func close() -> void:
	current_mount_point = null
	visible = false

func _on_button_pressed() -> void:
	if current_mount_point:
		current_mount_point.remove_gun()

	close()
