extends Node

@onready var parent: Enemy = $".."

func can_move() -> bool:
	return not parent.has_overlapping_areas()

func _physics_process(delta: float) -> void:
	if can_move():
		parent.global_position.x += delta * parent.speed
