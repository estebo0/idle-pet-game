extends Node2D

const ENEMY_SCENE = preload("res://scenes/Enemy.tscn")

@export var difficulty: int = 1

var spawn_timer: float = 0.0
var spawn_interval: float = 3.0

func _ready() -> void:
	# Dificultad más alta = enemigos más frecuentes
	spawn_interval = max(0.8, 3.0 - (difficulty - 1) * 0.4)

func _process(delta: float) -> void:
	spawn_timer -= delta
	if spawn_timer <= 0.0:
		_spawn_enemy()
		spawn_timer = spawn_interval

func _spawn_enemy() -> void:
	var enemy = ENEMY_SCENE.instantiate()
	enemy.add_to_group("enemies")
	# Escalar HP y daño según dificultad
	enemy.hp = 2 + difficulty
	var screen = get_viewport_rect().size
	enemy.position = Vector2(
		randf_range(60, screen.x - 60),
		randf_range(60, screen.y - 200)
	)
	get_parent().add_child(enemy)
