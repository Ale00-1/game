
extends Area3D
@export var speed: float = 30.0
@export var lifetime: float = 4.0
@export var damage: int = 100

var velocity: Vector3 = Vector3.ZERO
var time_alive: float = 0.0
var missile_owner: Node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(self, '_on_area_3d_body_entered'))

func launch(direction: Vector3, from_owner: Node) -> void:
	velocity = direction.normalized() * speed
	missile_owner = from_owner
	time_alive = 0.0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_transform.origin += velocity * delta
	time_alive += delta
	if time_alive > lifetime:
		queue_free()

func _on_body_entered(body: Node) -> void:
	if body == missile_owner:
		return
	if body.has_method("take_damage"):
		body.call('take_damage', damage)
		print('colisione con: ', body.name)
	queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == missile_owner:
		return
	if body.has_method("take_damage"):
		body.call('take_damage', damage)
		print('colisione con: ', body.name)
	queue_free()
