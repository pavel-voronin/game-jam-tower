extends Node

@onready var parent: Area2D = $".."
var hit := false

func _on_bullet_area_entered(enemy: Area2D) -> void:
	if hit:
		return
	if not enemy is Enemy:
		return
	enemy.hit(parent.strength)
	hit = true
	parent.queue_free()
