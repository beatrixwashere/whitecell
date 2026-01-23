@tool
extends Node
## saves and loads whitecelldata


func save_lists() -> void:
	var new_data := WhitecellData.new()
	for i in get_node("../listscroll/lists").get_children():
		if i.name != "add":
			new_data.list_names.append(i.get_node("header").text)
			new_data.list_colors.append(i.color)
			var i_items: Array
			for j in i.get_node("scroll/todo").get_children():
				i_items.append(j.get_node("label").text)
			new_data.list_items.append(i_items)
	DirAccess.remove_absolute("res://whitecell.tres")
	ResourceSaver.save(new_data, "res://whitecell.tres")


func load_lists() -> void:
	if not FileAccess.file_exists("res://whitecell.tres"):
		print("no save data found at res://whitecell.tres")
		return
	for i in get_node("../listscroll/lists").get_children():
		if i.name != "add":
			i.queue_free()
	var loaded_data: WhitecellData = ResourceLoader.load(
			"res://whitecell.tres", "",
			ResourceLoader.CACHE_MODE_IGNORE )
	for i in loaded_data.list_names.size():
		var i_list: Node = get_node("../listscroll/lists").new_list(loaded_data.list_names[i], true)
		i_list.color = loaded_data.list_colors[i]
		i_list.get_node("color/picker/dialog").color = loaded_data.list_colors[i]
		for j in loaded_data.list_items[i]:
			i_list.new_error(j)
