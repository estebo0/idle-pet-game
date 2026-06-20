extends Node2D

const SPEED = 180.0
const FOLLOW_DISTANCE = 60.0

var target: Node2D = null

func _ready() -> void:
	target = get_parent().get_node("Player")

func _process(delta: float) -> void:
	if target == null:
		return

	var distance = position.distance_to(target.position)

	if distance > FOLLOW_DISTANCE:
		var direction = (target.position - position).normalized()
		position += direction * SPEED * delta
