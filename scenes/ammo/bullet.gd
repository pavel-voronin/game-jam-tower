extends Area2D

@export var strength: int = 1

func _ready() -> void:
	$Bullets.play()
