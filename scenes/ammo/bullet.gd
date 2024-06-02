extends Area2D

@export var strength: float = 1.0

func _ready() -> void:
	$Bullets.play()
