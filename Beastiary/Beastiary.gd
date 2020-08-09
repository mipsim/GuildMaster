extends Control


func _on_openBook_pressed():
	var load_page = load("res://Beastiary/beastIndex.tscn").instance()
	.add_child(load_page)
