#pagesTest.gd
extends Control

func _on_quest1_pressed():
	var load_page = load("res://Pages/questBase.tscn").instance()
	.add_child(load_page)

func _on_quest2_pressed():
	var load_page = load("res://Pages/questBase.tscn").instance()
	.add_child(load_page)

func _on_quest3_pressed():
	var load_page = load("res://Pages/questBase.tscn").instance()
	.add_child(load_page)

func _on_quest4_pressed():
	var load_page = load("res://Pages/questBase.tscn").instance()
	.add_child(load_page)

func _on_quest5_pressed():
	var load_page = load("res://Pages/questBase.tscn").instance()
	.add_child(load_page)
