extends Node2D

@export var enemy_prefab: PackedScene
var pack_amount_conf = [1, 5]
var pack_delay_conf = [1.0, 2.0]
var pack_interval_conf = [0.5, 1.0]

var pack_amount
var pack_delay
var pack_interval

var timer: float = 0

func configure() -> void:
	pack_amount = randi_range(pack_amount_conf[0], pack_amount_conf[1])
	pack_delay = randf_range(pack_delay_conf[0], pack_delay_conf[1])
	pack_interval = randf_range(pack_interval_conf[0], pack_interval_conf[1])
	timer = pack_interval

func _ready() -> void:
	configure()

func _physics_process(delta: float) -> void:
	print(timer)
	timer -= delta

	if timer < 0:
		if pack_amount == 0:
			configure()
			return

		emit()
		pack_amount -= 1

		if pack_amount == 0:
			timer = pack_delay
		else:
			timer = pack_interval

func emit() -> void:
	var instance: Enemy = enemy_prefab.instantiate()
	get_parent().add_child(instance)
	instance.global_position = global_position
	instance.die.connect($"../Money".apprize)
