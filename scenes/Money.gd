class_name Money
extends Node

signal amount_updated(amount: int)

@export var amount: int = 25000

func add(amount: int) -> void:
	self.amount += amount
	amount_updated.emit(self.amount)

func can_spend(amount: int) -> bool:
	return self.amount >= amount

func spend(amount: int) -> void:
	if can_spend(amount):
		self.amount -= amount
		amount_updated.emit(self.amount)

func apprize(enemy: Enemy) -> void:
	add(enemy.cost)
