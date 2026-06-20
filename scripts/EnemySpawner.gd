extends Node2D

const ENEMY_SCENE = preload("res://scenes/Enemy.tscn")
const SPAWN_INTERVAL = 3.0

var spawn_timer: float = SPAWN_INTERVAL

func _process(delta: float) -> void:
	spawn_timer -= delta
	if spawn_timer <= 0.0:
		_spawn_enemy()
		spawn_timer = SPAWN_INTERVAL

func _spawn_enemy() -> void:
	var enemy = ENEMY_SCENE.instantiate()
	enemy.add_to_group("enemies")
	var screen = get_viewport_rect().size
	enemy.position = Vector2(
		randf_range(100, screen.x - 100),
		randf_range(100, screen.y - 100)
	)
	get_parent().add_child(enemy)
