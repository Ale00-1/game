#extends CharacterBody3D
#
#
#const SPEED = 5.0
#@onready var navAgent = $"../ProtoController/NavigationAgent3D"
#@onready var target= $"../ProtoController"
#var hp = 100
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	#
	#var currentLocation = global_transform.origin
	#var nextLocation = navAgent.get_next_path_position()
	#var nextVelocity = (nextLocation - currentLocation)
	#
	#velocity=velocity.move_toward(nextVelocity, 0.2)
	#
	#_target_position(target)
	#move_and_slide()
	#
#@warning_ignore("shadowed_variable")
#func _target_position(target):
	#navAgent.target_position=target.global_transform.origin
#
#func take_damage(amount : int) -> void:
	#hp -= amount
	#print('enemy took', amount, 'hp left: ', hp)
	#if hp <= 0:
		#die()
#
#func die():
	#queue_free()
	#
