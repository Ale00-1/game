extends CharacterBody3D

var player = null
var attack_range = 2.5
var state_machine
const SPEED = 5.0
@onready var anim_tree = $AnimationTree
@onready var nav_agent = $NavigationAgent3D
@export var player_path : NodePath
func _ready() -> void:
	player = get_node(player_path)
	state_machine = anim_tree.get('parameters/playback')
func _process(delta: float) -> void:
	velocity = Vector3.ZERO
	match state_machine.get_current_node():
		'Running_C':	
			nav_agent.set_target_position(player.global_transform.origin)
			var next_nav_point = nav_agent.get_next_path_position()
			velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
			if velocity.length() > 0.001:
				var look_target = global_position + velocity
				look_at(Vector3(look_target.x, global_position.y, look_target.z), Vector3.UP)
		'1H_Melee_Attack_Slice_Diagonal':
			var diff = player.global_position - global_position
			print("Diff length:", diff.length())
			if diff.length() > 0.001:
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
