# CharacterBody2D script
extends CharacterBody2D
@onready var animated_sprite2D = %AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
signal completed
var point: int=0
#disable collion and change animation to indicate door opening hi im vegus and im lowkey cracked(coke)
func _ready():
	collision_shape.set_deferred("disabled", false)
func _on_area_2d_4_not_box_comp() -> void:
	point+=1
	print("NOT")
	if point==4:
		collision_shape.set_deferred("disabled", true)
		$AnimatedSprite2D.play("door_open")
		completed.emit()


func _on_area_2d_3_or_box_comp():
	point+=1
	print("OR")
	if point==4:
		collision_shape.set_deferred("disabled", true)
		$AnimatedSprite2D.play("door_open")
		completed.emit()


func _on_area_2d_and_box_comp_1() :
	point+=1
	print("and")
	if point==4:
		collision_shape.set_deferred("disabled", true)
		$AnimatedSprite2D.play("door_open")
		completed.emit()



func _on_area_2d_2_and_box_comp_2() -> void:
	point+=1
	print("and")
	if point==4:
		collision_shape.set_deferred("disabled", true)
		$AnimatedSprite2D.play("door_open")
		completed.emit()
