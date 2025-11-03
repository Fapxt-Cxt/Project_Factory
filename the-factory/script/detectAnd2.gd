extends Area2D
signal AND_BOX_COMP_2


func _on_body_entered(body: Node2D) -> void:
	if body is ANDbox:
		AND_BOX_COMP_2.emit()
