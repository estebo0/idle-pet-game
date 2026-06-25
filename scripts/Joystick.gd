extends Node2D

signal direction_changed(dir: Vector2)

const RADIUS = 80.0
const KNOB_RADIUS = 30.0

var touching: bool = false
var touch_index: int = -1
var base_pos: Vector2 = Vector2.ZERO
var knob_pos: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	base_pos = position
	knob_pos = position

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and not touching:
			if event.position.distance_to(base_pos) < RADIUS * 1.5:
				touching = true
				touch_index = event.index
				_update_knob(event.position)
		elif not event.pressed and event.index == touch_index:
			touching = false
			touch_index = -1
			knob_pos = base_pos
			direction = Vector2.ZERO
			direction_changed.emit(direction)
			queue_redraw()

	elif event is InputEventScreenDrag:
		if event.index == touch_index:
			_update_knob(event.position)

func _update_knob(touch: Vector2) -> void:
	var offset = touch - base_pos
	if offset.length() > RADIUS:
		offset = offset.normalized() * RADIUS
	knob_pos = base_pos + offset
	direction = offset / RADIUS
	direction_changed.emit(direction)
	queue_redraw()

func _draw() -> void:
	# Base del joystick
	draw_circle(Vector2.ZERO, RADIUS, Color(1, 1, 1, 0.15))
	draw_arc(Vector2.ZERO, RADIUS, 0, TAU, 32, Color(1, 1, 1, 0.4), 2.0)
	# Knob
	var knob_offset = knob_pos - base_pos
	draw_circle(knob_offset, KNOB_RADIUS, Color(1, 1, 1, 0.4))
