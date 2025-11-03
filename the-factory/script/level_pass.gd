extends Control

func _ready():
	visible = false

func _on_home_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/level_select.tscn")

func _on_replay_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
