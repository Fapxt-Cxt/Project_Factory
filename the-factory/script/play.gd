
extends CharacterBody2D

const SPEED = 300

@onready var anim = $player
var last_dir = "front"

func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO

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
		
	if direction == Vector2(0,-1):
		anim.play("backidle")
	elif direction == Vector2(0,1):
		anim.play("frontidle")
	elif direction == Vector2(-1,0):
		anim.play("leftidle")
	elif direction == Vector2(1,0):
		anim.play("rightidle")
		
	velocity = direction * SPEED
	move_and_slide()
