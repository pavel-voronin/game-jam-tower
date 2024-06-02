extends Area2D

signal hp_updated(amount: int)
signal die

@export var hp: int = 100
@onready var levels: Node2D = $Levels
@onready var buy_button: TextureButton = $BuyLevelButton
@export var level_prefab: PackedScene = preload("res://scenes/level.tscn")

const MAX_TOWERS = 5
const DESIGNS_AMOUNT = 5
var designs = []

var root: Game

func hit(damage: int) -> void:
	hp -= damage
	hp_updated.emit(hp)
	if hp <= 0:
		die.emit()

func init_designs() -> void:
	for i in range(DESIGNS_AMOUNT):
		designs.append("%d" % [i + 1])
	#designs.reverse()

func set_root() -> void:
	var p = get_parent()
	while not p is Game:
		p = p.get_parent()
	root = p

func _ready() -> void:
	set_root()
	init_designs()
	place_level()
	root.get_node("Money").amount_updated.connect(update_buy_button)

func get_price() -> int:
	match levels.get_child_count():
		1:
			return 25
		2:
			return 75
		3:
			return 280
		_:
			return 1000

func update_buy_button(_amount: int) -> void:
	place_buy_button()

func place_buy_button() -> void:
	if levels.get_child_count() >= MAX_TOWERS:
		buy_button.hide()
	else:
		buy_button.show()
		buy_button.global_position = levels.global_position - Vector2(128, 108 * (levels.get_child_count()) + 108 / 2)
		buy_button.get_node("Cost").text = str(get_price())

		buy_button.disabled = get_price() > root.get_node("Money").amount

func place_level() -> void:
	var level: Level = level_prefab.instantiate()
	levels.add_child(level)
	level.global_position = levels.global_position - Vector2(0, 108 * (levels.get_child_count() - 1))
	var design = designs.pop_front()
	level.animation = "level%s" % design
	level.play()
	place_buy_button()

func _on_buy_level_button_pressed() -> void:
	if root.get_node("Money").can_spend(get_price()):
		root.get_node("Money").spend(get_price())
		place_level()
