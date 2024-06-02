extends Node

@onready var parent: Node2D = $".."
@onready var eyes: Node = $"../SeesClosestParabollicaly"
@onready var barrel: Sprite2D = $"../Barrel"
@onready var bullet_start_point: Marker2D = $"../Barrel/BulletStartPoint"

# Код для запуска снаряда
func fire(enemy: Enemy) -> void:
	var bullet: Node2D = parent.bullet_prefab.instantiate()
	bullet.strength = parent.strength
	parent.root.add_child(bullet)
	bullet.global_position = bullet_start_point.global_position

	# Устанавливаем фиксированный угол 45 градусов
	var launch_angle_degrees = 180.0 + 45.0
	var launch_angle_radians = deg_to_rad(launch_angle_degrees)
	bullet.rotation = launch_angle_radians

	# Вычисляем начальную скорость
	var target_position = enemy.global_position
	var dx = target_position.x - bullet.global_position.x
	var dy = target_position.y - bullet.global_position.y
	var initial_speed = calculate_initial_speed(dx, dy, launch_angle_radians, bullet.gravity)
	bullet.set_initial_velocity(initial_speed, launch_angle_radians)

# Функция для вычисления начальной скорости
func calculate_initial_speed(dx: float, dy: float, angle: float, gravity: float) -> float:
	# Используем уравнение движения для вычисления начальной скорости
	var tan_angle = tan(angle)
	var part1 = gravity * dx * dx
	var part2 = 2 * (dy - dx * tan_angle) * cos(angle) * cos(angle)
	var initial_speed_squared = part1 / part2
	return sqrt(initial_speed_squared)

func _on_timer_timeout() -> void:
	var enemy = eyes.get_closest_enemy()
	if enemy:
		fire(enemy)
