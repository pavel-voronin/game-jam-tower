extends Node

@onready var parent: Area2D = $".."
var distance := 0.0
const MAX_DISTANCE = 800.0
var initial_position: Vector2

func _ready() -> void:
	call_deferred("save_initial_position")

func save_initial_position() -> void:
	initial_position = parent.global_position

func _physics_process(delta: float) -> void:
	if parent.global_position.distance_to(initial_position) >= MAX_DISTANCE:
		parent.queue_free()
