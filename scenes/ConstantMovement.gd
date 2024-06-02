extends Node

@onready var parent: Enemy = $".."
@onready var sprite: AnimatedSprite2D = $"../AnimatedSprite"

func can_move() -> bool:
	return not parent.has_overlapping_areas()

func _physics_process(delta: float) -> void:
	if can_move():
		parent.global_position.x += delta * parent.speed
		sprite.play("walk")
