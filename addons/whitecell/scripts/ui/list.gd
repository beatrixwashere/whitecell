@tool
extends ColorRect
## handles list customization and orgnaization


func new_error(ename: String = "todo") -> void:
	var error_node: Node = load("res://addons/whitecell/scenes/error.tscn").instantiate()
	error_node.get_node("label_rich").text = ename
	$scroll/todo.add_child(error_node)


func delete_list() -> void:
	queue_free()


func change_color(clr: Color) -> void:
	color = clr


func toggle_color_picker(vis: bool) -> void:
	$color/picker.visible = vis


func move_list(diff: int) -> void:
	get_parent().move_child(self, min(max(get_index() + diff, 0), get_parent().get_child_count() - 2))
