extends Node

@onready var parent: Node2D = $".."
@onready var barrel: Sprite2D = $"../Barrel"
@onready var attack_area: Area2D = $"../AttackArea"

func get_closest_enemy() -> Enemy:
	var closest_enemy: Enemy = null
	var closest_distance: float = INF

	for enemy in attack_area.get_overlapping_areas():
		if enemy is Enemy:
			var distance = parent.global_position.distance_to(enemy.global_position)
			if distance < closest_distance:
				closest_distance = distance
				closest_enemy = enemy

	return closest_enemy

func _physics_process(delta: float) -> void:
	var enemy = get_closest_enemy()
	if enemy:
		barrel.look_at(enemy.global_position)

