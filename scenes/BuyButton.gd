extends Button

signal buy(prefab: PackedScene, price: int)

@export var price: int
@export var prefab: PackedScene

func _on_pressed() -> void:
	buy.emit(prefab, price)
