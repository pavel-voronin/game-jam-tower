extends Panel

var current_mount_point: MointPoint
@onready var money: Money = $"../../Money"

func _ready() -> void:
	money.amount_updated.connect(update_buttons)
	update_buttons(money.amount)

func update_buttons(amount: int) -> void:
	var bullet_gun = $VBoxContainer/MarginContainer2/GridContainer/BulletGun/Button
	var grenade_launcher = $VBoxContainer/MarginContainer2/GridContainer/GrenadeLauncher/Button

	bullet_gun.disabled = bullet_gun.price > amount
	grenade_launcher.disabled = grenade_launcher.price > amount

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
