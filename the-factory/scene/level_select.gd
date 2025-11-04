extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_goback_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")


func _on_level_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/map_1.tscn")


func _on_level_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/map_2.tscn")


func _on_level_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/map_3.tscn")


func _on_level_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/map_4.tscn")


func _on_level_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/map5.tscn")
