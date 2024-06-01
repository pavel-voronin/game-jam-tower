extends Node

@onready var parent: Enemy = $".."
@onready var hp_bar: TextureProgressBar = $"../HPBar"

func _ready() -> void:
	hp_bar.max_value = parent.hp
	hp_bar.visible = false
	parent.hp_updated.connect(update_hp)

func update_hp(amount: int) -> void:
	hp_bar.visible = true
	hp_bar.value = amount
