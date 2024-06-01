class_name Game
extends Node2D

func _on_tower_die() -> void:
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
