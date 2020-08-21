# TXTDebug.gd
# Prints menu of TXT content with index numbers
extends Control

# Var for all txt files
onready var file_foods = 'res://food/txt/Foods.txt'
onready var file_food_hover = 'res://food/txt/Food_Hover.txt'
onready var file_food_norm_review = 'res://food/txt/Food_NormalReview.txt'
onready var file_food_zomb_review = 'res://food/txt/Food_ZombieReview.txt'

func _ready():
	load_file(file_foods)
	load_file(file_food_hover)
	load_file(file_food_norm_review)
	load_file(file_food_zomb_review)
	
	print_file($Center/Hbox/Foods/Label, file_foods)
	print_file($Center/Hbox/Hover/Label, file_food_hover)
	print_file($Center/Hbox/Normal/Label, file_food_norm_review)
	print_file($Center/Hbox/Zombie/Label, file_food_zomb_review)

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
	f.close()
	return

func print_file(path, file):
	var f = File.new()
	f.open(file, File.READ)
	var index = 1
	path.text = "\nFile: " + file + "\n\n"
	
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		line += " "
		path.text += str(index) + " " + line + "\n"

		index += 1
	f.close()
	return
