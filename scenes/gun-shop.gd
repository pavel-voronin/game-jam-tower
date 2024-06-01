extends Panel

var current_mount_point: MointPoint
@onready var money: Money = $"../../Money"

func _on_close_button_pressed() -> void:
	visible = false

func open(mount_point: MointPoint) -> void:
	current_mount_point = mount_point
	visible = true

func close() -> void:
	current_mount_point = null
	visible = false

func _on_button_buy(prefab: PackedScene, price: int) -> void:
	if not money.can_spend(price):
		return

	money.spend(price)

	var gun: Gun = prefab.instantiate()
	current_mount_point.place_gun(gun)

	close()
