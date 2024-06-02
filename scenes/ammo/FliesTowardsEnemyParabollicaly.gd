extends Node

@onready var parent: Area2D = $".."
@export var speed: float = 120.0
@export var gravity: float = 9.8
var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta * speed
	if parent.global_position.y + velocity.y * delta < 600:
		parent.global_position += velocity * delta
