extends Gun

@export var strength: float = 5.0
var bullet_prefab: PackedScene = preload("res://scenes/ammo/grenade.tscn")
var root: Game

func _ready() -> void:
	var p = get_parent()
	while not p is Game:
		p = p.get_parent()
	root = p
