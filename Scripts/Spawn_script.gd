extends Node3D
#
#var point1: Vector3
#var point2: Vector3
#
#@onready var enemy_to_spawn: Resource = preload("res://Scenes/Enemy.tscn")
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass
#
#func _get_random_point_inside (p1: Vector3, p2:Vector3) -> Vector3:
	#var x_value: float = randf_range(p1.x, p2.x)
	#var y_value: float = randf_range(p1.y, p2.y)
	#var z_value: float = randf_range(p1.z, p2.z)
	#
	#var random_point_inside: Vector3 = Vector3(x_value, y_value, z_value)
	#
	#return(random_point_inside)
#
#func spawn_enemy():
	#var enemy_instance: Node3D = enemy_to_spawn.instantiate()
	#get_tree().current_scene.add_child(enemy_instance)
	#var p1 = $Point1.global_position
	#var p2 = $Point2.global_position
	#var spawn_location: Vector3 = _get_random_point_inside(p1, p2)
	#enemy_instance.global_position = spawn_location
#
#
#func _process(delta: float) -> void:
	#pass
#
#
#func _on_timer_timeout() -> void:
	#spawn_enemy()
