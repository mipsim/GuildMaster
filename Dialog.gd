# Dialog.gd
extends Node

# Var for txt file
onready var dialog_txt = 'res://txt/Dialogue.txt'
onready var drag_response_txt = 'res://txt/Drag_ResponseTest.txt'

# Number of lines in txt file
var dialog_size = 1
var drag_response_size = 1

# Methods =====================================

func _ready():
	load_file(dialog_txt)
	load_file(drag_response_txt)
	
	print("Dialog size: " + str(dialog_size))
	print("Drag_Response size: " + str(drag_response_size))

# Generic File Loader
func load_file(file):
	var f = File.new()
	f.open(file, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		line += " "
		#print(line + str(index))

		index += 1
		
		if (file == dialog_txt):
			dialog_size += 1
		if (file == drag_response_txt):
			drag_response_size += 1

	f.close()
	return

# Getters ====================================

# Call index on Dialogue.txt
func _get_dialog(index_call):
	var f = File.new()
	f.open(dialog_txt, File.READ)
	var index = 1
	
	# iterate through all lines until the end of file is reached
	while not f.eof_reached(): 
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	
	f.close()
	return "Line of dialogue not found, invalid index"

func _get_dialog_size():
	return dialog_size

# Call index on Drag_ResponseTest.txt
func _get_drag_response(index_call):
	var f = File.new()
	f.open(drag_response_txt, File.READ)
	var index = 1
	
	# iterate through all lines until the end of file is reached
	while not f.eof_reached(): 
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	
	f.close()
	return "Line of dialogue not found, invalid index"

func _get_drag_response_size():
	return drag_response_size
