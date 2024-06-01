extends Gun

@export var strength: int = 1
var bullet_prefab: PackedScene = preload("res://scenes/bullet.tscn")
var root: Game

func _ready() -> void:
	var p = get_parent()
	while not p is Game:
		p = p.get_parent()
	root = p
