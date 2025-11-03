
extends CharacterBody2D

const SPEED = 165

var last_movement_direction: Vector2 = Vector2.ZERO

@onready var anim = $player
var last_dir = "front"

func _ready():
	add_to_group("pusher")

func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO
	var input_dir = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	if Input.is_action_pressed("ui_up"):
		direction = Vector2(0, -1)
		anim.play("backidle")
		last_dir = "back"
	elif Input.is_action_pressed("ui_down"):
		direction = Vector2(0, 1)
		anim.play("frontidle")
		last_dir = "front"
	elif Input.is_action_pressed("ui_left"):
		direction = Vector2(-1, 0)
		anim.play("leftidle")
		last_dir = "left"
	elif Input.is_action_pressed("ui_right"):
		direction = Vector2(1, 0)
		anim.play("rightidle")
		last_dir = "right"

	velocity = direction * SPEED
	move_and_slide()
	if input_dir != Vector2.ZERO:
		last_movement_direction = input_dir.normalized()

func get_last_movement_direction() -> Vector2:
	return last_movement_direction
