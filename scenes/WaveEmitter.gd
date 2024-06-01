extends Node2D

@export var enemy_prefab: PackedScene

func emit() -> void:
	var instance: Enemy = enemy_prefab.instantiate()
	get_parent().add_child(instance)
	instance.global_position = global_position
	instance.die.connect($"../Money".apprize)

func _on_timer_timeout() -> void:
	emit()
