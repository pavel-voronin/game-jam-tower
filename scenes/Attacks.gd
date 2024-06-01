extends Node

@onready var parent: Enemy = $".."
@onready var attack_area: Area2D = $"../AttackArea"
@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	for area in attack_area.get_overlapping_areas():
		hit(area)

func _on_attack_area_area_entered(area: Area2D) -> void:
	hit(area)
	timer.start()

func hit(area: Area2D) -> void:
	area.hit(parent.strength)
