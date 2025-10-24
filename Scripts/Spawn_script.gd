extends Node3D

var point1: Vector3
var point2: Vector3

var max_amount : int = 0
@onready var player_path_for_spawn = $".."
@onready var enemy_to_spawn: Resource = preload("res://Scenes/enemy_fixed.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _get_random_point_inside (p1: Vector3, p2:Vector3) -> Vector3:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = 0.0
	var z_value: float = randf_range(p1.z, p2.z)
	
	var random_point_inside: Vector3 = Vector3(x_value, y_value, z_value)
	
	return(random_point_inside)

func spawn_enemy():
	var enemy_instance: Node3D = enemy_to_spawn.instantiate()
	enemy_instance.add_to_group("enemies")
	enemy_instance.player = player_path_for_spawn
	get_tree().current_scene.add_child(enemy_instance)
	var p1 = $Point1.global_position
	var p2 = $Point2.global_position
	var spawn_location: Vector3 = _get_random_point_inside(p1, p2)
	enemy_instance.global_position = spawn_location
		



func _process(delta: float) -> void:
	max_amount = get_tree().get_node_count_in_group("enemies")
	
func _on_timer_timeout() -> void:
	if max_amount <= 10:
		spawn_enemy()
	else:
		pass
