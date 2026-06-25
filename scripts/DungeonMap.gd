extends Node2D

const TILE_SIZE = 32
const MAP_WIDTH = 15
const MAP_HEIGHT = 125

const FLOOR_TEX = preload("res://assets/sprites/dungeon_floor_tile_16x16.png")
const WALL_TEX = preload("res://assets/sprites/dungeon_wall_tile_16x16.png")
const CORNER_TEX = preload("res://assets/sprites/dungeon_wall_corner_top_left_16x16.png")
const VOID_TEX = preload("res://assets/sprites/dungeon_void.png")

# 0=void, 1=floor, 2=wall, 3=corner
func _ready() -> void:
	var map = _generate_map()
	_draw_map(map)

func _generate_map() -> Array:
	var map = []
	for y in range(MAP_HEIGHT):
		var row = []
		for x in range(MAP_WIDTH):
			if x == 0 and y == 0:
				row.append(3)  # esquina superior izquierda
			elif x == MAP_WIDTH - 1 and y == 0:
				row.append(3)  # esquina superior derecha
			elif x == 0 or x == MAP_WIDTH - 1:
				row.append(2)  # paredes laterales
			elif y == 0:
				row.append(2)  # pared superior
			else:
				row.append(1)  # suelo
		map.append(row)
	return map

func _draw_map(map: Array) -> void:
	for y in range(MAP_HEIGHT):
		for x in range(MAP_WIDTH):
			var tile = Sprite2D.new()
			tile.texture = _get_texture(map[y][x])
			tile.scale = Vector2(2, 2)
			tile.position = Vector2(x * TILE_SIZE + TILE_SIZE / 2, y * TILE_SIZE + TILE_SIZE / 2)
			tile.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
			# Voltear esquina superior derecha
			if map[y][x] == 3 and x == MAP_WIDTH - 1:
				tile.flip_h = true
			add_child(tile)

func _get_texture(tile_type: int) -> Texture2D:
	match tile_type:
		0: return VOID_TEX
		1: return FLOOR_TEX
		2: return WALL_TEX
		3: return CORNER_TEX
	return FLOOR_TEX
