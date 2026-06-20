extends Node2D

const SPEED = 180.0
const FOLLOW_DISTANCE = 60.0
const ATTACK_RANGE = 80.0
const ATTACK_DAMAGE = 1
const ATTACK_COOLDOWN = 0.8

var target: Node2D = null
var attack_timer: float = 0.0

func _ready() -> void:
	target = get_parent().get_node("Player")

func _process(delta: float) -> void:
	attack_timer -= delta

	var nearest_enemy = _get_nearest_enemy()

	if nearest_enemy != null and position.distance_to(nearest_enemy.position) <= ATTACK_RANGE:
		# Atacar al enemigo más cercano
		if attack_timer <= 0.0:
			nearest_enemy.take_damage(ATTACK_DAMAGE)
			attack_timer = ATTACK_COOLDOWN
	elif target != null and position.distance_to(target.position) > FOLLOW_DISTANCE:
		# Seguir al jugador si no hay enemigos cerca
		var direction = (target.position - position).normalized()
		position += direction * SPEED * delta

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
