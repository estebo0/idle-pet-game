extends Node2D

const SPEED = 180.0
const FOLLOW_DISTANCE = 60.0
const ATTACK_RANGE = 200.0
const ATTACK_COOLDOWN = 0.8

const PROJECTILE_SCENE = preload("res://scenes/Projectile.tscn")

var target: Node2D = null
var attack_timer: float = 0.0

func _ready() -> void:
	target = get_parent().get_node("Player")

func _process(delta: float) -> void:
	attack_timer -= delta

	var nearest_enemy = _get_nearest_enemy()

	if nearest_enemy != null and position.distance_to(nearest_enemy.position) <= ATTACK_RANGE:
		# Disparar al enemigo más cercano
		if attack_timer <= 0.0:
			_shoot(nearest_enemy)
			attack_timer = ATTACK_COOLDOWN

	# Siempre seguir al jugador manteniendo distancia
	if target != null and position.distance_to(target.position) > FOLLOW_DISTANCE:
		var direction = (target.position - position).normalized()
		position += direction * SPEED * delta

func _shoot(enemy: Node2D) -> void:
	var proj = PROJECTILE_SCENE.instantiate()
	proj.position = position
	proj.direction = (enemy.position - position).normalized()
	get_parent().add_child(proj)

func _get_nearest_enemy() -> Node2D:
	var enemies = get_tree().get_nodes_in_group("enemies")
	var nearest: Node2D = null
	var min_dist = INF
	for enemy in enemies:
		var d = position.distance_to(enemy.position)
		if d < min_dist:
			min_dist = d
			nearest = enemy
	return nearest
