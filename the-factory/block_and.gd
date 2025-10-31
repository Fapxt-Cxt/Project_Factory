extends Area2D

extends CharacterBody2D

@export var move_speed: float = 100.0
@export var acceleration: float = 800.0
@export var friction: float = 600.0

var is_being_pushed: bool = false
var push_direction: Vector2 = Vector2.ZERO
var pushers: Array[Node2D] = []

func _ready():
	$PushArea.body_entered.connect(_on_pusher_entered)
	$PushArea.body_exited.connect(_on_pusher_exited)

func _physics_process(delta):
	if pushers.size() > 0:
		update_push_direction()
	
	if is_being_pushed:
		velocity = velocity.move_toward(push_direction * move_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()

func _on_pusher_entered(body: Node2D):
	if body.is_in_group("pusher"):
		pushers.append(body)
		is_being_pushed = true

func _on_pusher_exited(body: Node2D):
	if body in pushers:
		pushers.erase(body)
	
	if pushers.size() == 0:
		stop_push()

func update_push_direction():
	if pushers.size() == 0:
		return
	
	var total_direction = Vector2.ZERO
	for pusher in pushers:
		# Use the pusher's movement direction instead of position
		if pusher.has_method("get_last_movement_direction"):
			total_direction += pusher.get_last_movement_direction()
		elif pusher is CharacterBody2D:
			# Estimate direction from velocity
			total_direction += pusher.velocity.normalized()
		else:
			# Fallback to position-based (but improved)
			var dir_to_block = (global_position - pusher.global_position).normalized()
			# Only use the dominant axis to prevent diagonal sticking
			if abs(dir_to_block.x) > abs(dir_to_block.y):
				total_direction.x += -sign(dir_to_block.x)
			else:
				total_direction.y += -sign(dir_to_block.y)
	
	push_direction = total_direction.normalized()

func stop_push():
	is_being_pushed = false
