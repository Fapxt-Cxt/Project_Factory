extends Control

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().pause = is_paused
	visible = is_paused


func _on_resume_pressed() -> void:
	self.is_paused = false


func _on_quit_pressed() -> void:
	get_tree().quit()
