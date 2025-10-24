extends CharacterBody3D
#
var player = Node3D
var attack_range = 1.5
var state_machine
const SPEED = 2.5
var hp = 100
@onready var anim_tree = $AnimationTree
@onready var nav_agent = $NavigationAgent3D
func _ready() -> void:
	if player != null:
		print('Player Asignado:', player.name)
	state_machine = anim_tree.get('parameters/playback')
func _process(delta: float) -> void:
	velocity = Vector3.ZERO
	match state_machine.get_current_node():
		'Running_C':	
			nav_agent.set_target_position(player.global_transform.origin)
			var next_nav_point = nav_agent.get_next_path_position()
			velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
			look_at(Vector3(global_position.x + velocity.x, global_position.y, global_position.z + velocity.z), Vector3.UP)
		'Unarmed_Melee_Attack_Punch_A':
				look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP)
	
	anim_tree.set('parameters/conditions/attacking', _target_in_range())
	anim_tree.set('parameters/conditions/run', not _target_in_range())
	
	anim_tree.get('parameters/playback')
	move_and_slide()

func _target_in_range():
	return global_position.distance_to(player.global_position) < attack_range

func _hit_finished():
	if global_position.distance_to(player.global_position) < attack_range + 1.0:
		var dir = global_position.direction_to(player.global_position)
		player.hit(dir)
func take_damage(amount : int) -> void:
	hp -= amount
	print('enemy took', amount, 'hp left: ', hp)
	if hp <= 0:
		die()
func die():
	anim_tree.set('parameters/conditions/die', true)
	await get_tree().create_timer(2.633).timeout
	queue_free()
