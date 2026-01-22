@tool
extends ColorRect
## handles list customization and orgnaization

@export var list_name: String = "list"


func new_error() -> void:
	var error_node: Node = load("res://addons/whitecell/scenes/error.tscn").instantiate()
	$scroll/todo.add_child(error_node)
