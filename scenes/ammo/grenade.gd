extends Area2D

@export var strength: int = 5
@onready var movement = $FliesTowardsEnemyParabollicaly

func set_initial_velocity(speed: float, angle: float) -> void:
	movement.velocity = Vector2(speed * cos(angle), speed * sin(angle))
