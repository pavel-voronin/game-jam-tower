class_name Enemy
extends Area2D

signal hp_updated(amount: int)
signal die(enemy: Enemy)

@export var hp: int = 2
@export var cost: int = 1
@export var speed: int = 100
@export var strength: int = 1

func hit(damage: int) -> void:
	hp -= damage
	if hp <= 0:
		die.emit(self)
		queue_free()
	else:
		hp_updated.emit(hp)
