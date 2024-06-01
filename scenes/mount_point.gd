class_name MointPoint
extends Node2D

@onready var marker: Marker2D = $Marker2D
@onready var buy_button: TextureButton = $BuyButton
@onready var edit_button: TextureButton = $EditButton
@export var price: int = 5
var gun: Gun
var root: Game

func set_root() -> void:
	var p = get_parent()
	while not p is Game:
		p = p.get_parent()
	root = p

func _ready() -> void:
	set_root()
	root.get_node("Money").amount_updated.connect(update_state)
	update_state(root.get_node("Money").amount)

func update_state(amount: int) -> void:
	buy_button.visible = gun == null
	edit_button.visible = gun != null

	if buy_button.visible:
		if price <= amount:
			buy_button.disabled = false
			return
		if price > amount:
			buy_button.disabled = true
			return

func place_gun(new_gun: Gun) -> void:
	gun = new_gun
	add_child(new_gun)
	gun.global_position = marker.global_position
	update_state(root.get_node("Money").amount)

func remove_gun() -> void:
	remove_child(gun)
	gun.queue_free()
	gun = null
	update_state(root.get_node("Money").amount)

func _on_button_pressed() -> void:
	root.get_node("UI").open_buy_a_gun_modal(self)


func _on_edit_button_pressed() -> void:
	root.get_node("UI").open_edit_gun_modal(self)
