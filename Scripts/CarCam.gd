extends Camera3D

@export var target_path: NodePath
@export var follow_distance: float = 10.0
@export var follow_height: float = 5.0
@export var smoothness: float = 0.1

var target: Node

func _ready():
	target = get_node(target_path)
	set_physics_process(true)

func _physics_process(delta):
	if target:
		var target_position: Vector3 = target.global_transform.origin
		var desired_position: Vector3 = target_position - target.transform.basis.z * follow_distance
		desired_position.y += follow_height
		
		global_transform.origin = lerp(global_transform.origin, desired_position, smoothness)
		look_at(target.global_transform.origin, Vector3.UP)
