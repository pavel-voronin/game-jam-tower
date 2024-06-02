extends Gun

@export var strength: int = 5
var bullet_prefab: PackedScene = preload("res://scenes/ammo/grenade.tscn")
var root: Game

func _ready() -> void:
	var p = get_parent()
	while not p is Game:
		p = p.get_parent()
	root = p
