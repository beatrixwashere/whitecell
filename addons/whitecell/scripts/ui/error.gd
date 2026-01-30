@tool
extends ColorRect
## handles error completion


func complete_error() -> void:
	queue_free()


func move_error(diff: int) -> void:
	get_parent().move_child(self, min(max(get_index() + diff, 0), get_parent().get_child_count() - 1))


func switch_display(editing: bool) -> void:
	if editing:
		$label_edit.text = $label_rich.text
		$label_rich.visible = false
	else:
		$label_rich.text = $label_edit.text
		$label_edit.text = ""
		$label_rich.visible = true
