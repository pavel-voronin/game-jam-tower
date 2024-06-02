extends Node

@onready var parent: Area2D = $".."
@export var speed: float = 1000.0
var distance := 0.0
const MAX_DISTANCE = 600.0

func _physics_process(delta: float) -> void:
	parent.global_position += Vector2(cos(parent.rotation), sin(parent.rotation)) * speed * delta
