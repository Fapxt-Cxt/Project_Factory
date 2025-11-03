extends Area2D
signal AND_BOX_COMP


func _on_body_entered(body: Node2D) -> void:
	if body is ANDbox:
		AND_BOX_COMP.emit()
