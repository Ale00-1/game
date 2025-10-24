extends AnimationTree
@onready var anim_tree = $AnimationTree

func _ready():
	anim_tree.connect("animation_node_start", Callable(self, "_on_anim_start"))
	anim_tree.connect("animation_node_end", Callable(self, "_on_anim_end"))

func _on_anim_start(node_name: String):
	if node_name == "Spawn_Ground_Skeletons":
		print("Spawn animation started!")
		$Skeleton3D.rotation.y = deg_to_rad(180)

func _on_anim_end(node_name: String):
	if node_name == "Spawn_Ground_Skeletons":
		print("Spawn animation finished!")
