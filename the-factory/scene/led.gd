extends CharacterBody2D
func _ready():
	%AnimatedSprite2D.play("LED_off")

func _on_door_completed():
	%AnimatedSprite2D.play("LED_on")


func _on_door_2_completed() -> void:
	%AnimatedSprite2D.play("LED_on")
