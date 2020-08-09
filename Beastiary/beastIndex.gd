extends Control


func _on_Button_pressed():
	var load_page = load("res://Beastiary/beastPage.tscn").instance()
	.add_child(load_page)


func _on_Button2_pressed():
	var load_page = load("res://Beastiary/beastPage.tscn").instance()
	.add_child(load_page)


func _on_Button3_pressed():
	var load_page = load("res://Beastiary/beastPage.tscn").instance()
	.add_child(load_page)


func _on_Button4_pressed():
	var load_page = load("res://Beastiary/beastPage.tscn").instance()
	.add_child(load_page)


func _on_Button5_pressed():
	queue_free()
