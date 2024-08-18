extends Node

func instantiate_particle(particle : String, particle_position : Vector3) -> void:
	var inst : Node3D = load(particle).instantiate()
	if inst:
		add_child(inst)
		inst.global_position = particle_position
		#inst.global_rotation = particle_rotation
	else:
		print_debug("Could not load particle")
