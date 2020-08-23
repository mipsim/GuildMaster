# Dialog.gd
extends Node

# Var for txt file
onready var currentDialog = 'res://txt/Dialogue.txt'

# Number of lines in txt file
var dialog_size = 1

# Methods =====================================

func _ready():
	#load_file(dialog_txt)
	#load_file(drag_response_txt)
	pass

# Generic File Loader
# counts the number of lines in the file
# call this every time need to read text
func load_file(file):
	#everytime you load_file it's for a new file so reset stats
	dialog_size = 1
	currentDialog = file
	var f = File.new()
	f.open(currentDialog, File.READ)
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		dialog_size += 1
	f.close()
	return
# Getters ====================================
# Call index on Dialogue.txt
# after you have loaded the file, then call _get_dialog to read from it
func _get_dialog(index_call):
	var f = File.new()
	f.open(currentDialog, File.READ)
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

