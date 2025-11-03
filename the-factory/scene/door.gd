# CharacterBody2D script
extends CharacterBody2D
@onready var animated_sprite2D = %AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
signal completed
func _on_area_2d_or_box_comp() -> void:
	collision_shape.set_deferred("disabled", true)
	$AnimatedSprite2D.play("door_open")
	completed.emit()
#disable collion and change animation to indicate door opening hi im vegus and im lowkey cracked(coke)
