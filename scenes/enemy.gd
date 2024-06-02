class_name Enemy
extends Area2D

signal hp_updated(amount: float)
signal die(enemy: Enemy)

@export var hp: float
@export var cost: int
@export var speed: int
@export var strength: float
var wave_number: int

func _ready() -> void:
	hp = 1.2 * wave_number
	cost = 1 * wave_number
	speed = randi_range(90, 110) + wave_number * 3
	strength = 0.4 * wave_number

func hit(damage: float) -> void:
	hp -= damage
	if hp <= 0:
		die.emit(self)
		queue_free()
	else:
		hp_updated.emit(hp)
