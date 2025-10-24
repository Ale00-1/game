extends Node3D
const tile_size: float = 2.05
const HEX_TILE = preload("res://Scenes/hex_Grass.tscn")
var grid_size : int = 40
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_generate_grid()

func _generate_grid():
	for x in range(grid_size):
		var tile_coords := Vector2.ZERO
		tile_coords.x = x * tile_size * cos(deg_to_rad(30))
		tile_coords.y = 0 if x % 2 == 0 else tile_size / 2
		for y in range(grid_size):
			var tile = HEX_TILE.instantiate()
			add_child(tile)
			tile.translate(Vector3(tile_coords.y, 0, tile_coords.x))
			tile_coords.y += tile_size
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
