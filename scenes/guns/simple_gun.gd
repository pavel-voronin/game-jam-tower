extends Gun

@export var strength: float = 1.5
var bullet_prefab: PackedScene = preload("res://scenes/ammo/bullet.tscn")
var root: Game

func _ready() -> void:
	var p = get_parent()
	while not p is Game:
		p = p.get_parent()
	root = p
