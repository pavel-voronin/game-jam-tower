extends Node

@onready var parent: Area2D = $".."
@export var radius: float = 150.0
@onready var explosion: MeshInstance2D = $"../Boom"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
var boomed := false

func _physics_process(delta: float) -> void:
	if parent.global_position.y >= 582 and not boomed:
		boom()

func _on_bullet_area_entered(enemy_or_ground: Area2D) -> void:
	boom()

func boom() -> void:
	if boomed:
		return
	boomed = true
	$"../Bullets".visible = false
	animation_player.play("boom")

	for enemy in get_tree().get_nodes_in_group("enemies"):
		var distance = parent.global_position.distance_to(enemy.global_position)

		if distance <= radius:
			print(enemy)
			enemy.hit(parent.strength)

	await animation_player.animation_finished
	parent.queue_free()
