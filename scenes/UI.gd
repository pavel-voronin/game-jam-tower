extends CanvasLayer

@onready var hp_label: Label = $HP
@onready var resource_label: Label = $Resource
@onready var buy_a_gun_modal: Panel = $GunShop
@onready var edit_gun_modal: Panel = $GunWorkshop

func _on_tower_hp_updated(amount: int) -> void:
	hp_label.text = "HP: %d/%d" % [amount, 100]

func _on_money_amount_updated(amount: int) -> void:
	resource_label.text = "Money: %d" % amount

func open_buy_a_gun_modal(mount_point: MointPoint) -> void:
	buy_a_gun_modal.open(mount_point)

func open_edit_gun_modal(mount_point: MointPoint) -> void:
	edit_gun_modal.open(mount_point)
