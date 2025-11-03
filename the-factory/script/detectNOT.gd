extends Area2D
signal NOT_BOX_COMP


func _on_body_entered(body: Node2D) -> void:
	if body is NOTbox:
		print("NOT")
		NOT_BOX_COMP.emit()
