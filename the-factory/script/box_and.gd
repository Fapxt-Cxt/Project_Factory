extends RigidBody2D

@export var block_type: String = "and"
@export var move_speed := 6.0

var target_position: Vector2
var moving := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var _target_position: Vector2
	var moving := false

func try_move(direction: Vector2) -> bool:
	if moving:
		return false
	var new_pos = target_position + direction * 32 # ขยับ 1 ช่อง (32px)
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_point(new_pos, 1)
	if result.size() == 0:
		target_position = new_pos
		moving = true
		return true
	else:
		return false
		
func _physics_process(delta):
	if moving:
		global_position = global_position.move_toward(target_position, move_speed)
		if global_position == target_position:
			moving = false
