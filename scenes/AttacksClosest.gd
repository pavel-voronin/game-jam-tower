extends Node

@onready var parent: Node2D = $".."
@onready var eyes: Node = $"../SeesClosest"
@onready var bullet_start_point: Marker2D = $"../BulletStartPoint"
@onready var audio: AudioStreamPlayer = $"../AudioStreamPlayer"

func fire(enemy: Enemy) -> void:
	var bullet: Node2D = parent.bullet_prefab.instantiate()
	bullet.strength = parent.strength
	parent.root.add_child(bullet)
	bullet.global_position = bullet_start_point.global_position
	bullet.look_at(enemy.global_position - Vector2(0, 54))
	audio.play()

func _on_timer_timeout() -> void:
	var enemy = eyes.get_closest_enemy()
	if enemy:
		fire(enemy)
