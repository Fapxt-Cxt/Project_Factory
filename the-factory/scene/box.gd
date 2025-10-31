extends CharacterBody2D

@onready var ray = $RayCast2D
var grid_size = 32
var input = {
	"ui_up" : Vector2.UP,
	"ui_down" : Vector2.DOWN,
	"ui_left" : Vector2.LEFT,
	"ui_right" : Vector2.RIGHT
}

func move(dir):
	var vector_pos = input[dir] + grid_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_pos
		return true
	return false
