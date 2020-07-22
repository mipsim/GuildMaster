# Dialog.gd
extends Node

# Var for txt file
onready var dialog_txt = 'res://txt/Dialogue.txt'

# Number of lines in txt file
var txt_size = 1

# Methods =====================================

func _ready():
	load_file(dialog_txt)

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
		txt_size += 1
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

func _get_txt_size():
	return txt_size
