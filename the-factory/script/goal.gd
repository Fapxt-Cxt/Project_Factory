extends Area2D

@onready var level_pass_ui = get_node("../CanvasLayer/LevelPass")

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		level_pass_ui.visible = true
		body.set_physics_process(false)
