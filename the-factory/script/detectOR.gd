extends Area2D
signal OR_BOX_COMP


func _on_body_entered(body: Node2D) -> void:
	if body is ORbox:
		OR_BOX_COMP.emit()
