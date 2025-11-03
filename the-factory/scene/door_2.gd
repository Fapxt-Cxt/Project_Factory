# CharacterBody2D script
extends CharacterBody2D
@onready var animated_sprite2D = %AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
signal completed
#disable collion and change animation to indicate door opening hi im vegus and im lowkey cracked(coke)
var point: int=0
func _on_area_2d_not_box_comp():
	point+=1
	print("not")
	if point==2:
		collision_shape.set_deferred("disabled", true)
		$AnimatedSprite2D.play("door_open")
		completed.emit()
func _on_area_2d_2_and_box_comp():
	point+=1
	print("and")
	if point==2:
		collision_shape.set_deferred("disabled", true)
		$AnimatedSprite2D.play("door_open")
		completed.emit()
