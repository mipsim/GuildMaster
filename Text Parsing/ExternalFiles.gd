# ExternalFiles.gd
extends Node

# Var for all txt files
onready var file_foods = 'res://food/txt/Foods.txt'
onready var file_food_hover = 'res://food/txt/Food_Hover.txt'
onready var file_food_norm_review = 'res://food/txt/Food_NormalReview.txt'
onready var file_food_zomb_review = 'res://food/txt/Food_ZombieReview.txt'
onready var file_stage = 'res://food/txt/Stage.txt'
onready var file_group = 'res://food/txt/Group.txt'
onready var file_income = 'res://food/txt/Income.txt'
onready var file_hunger_fill = 'res://food/txt/HungerFill.txt'
onready var file_addiction = 'res://food/txt/Addiction.txt'


# Methods =====================================

func _ready():
	load_file(file_foods)
	load_file(file_food_hover)
	load_file(file_food_norm_review)
	load_file(file_food_zomb_review)
	load_file(file_stage)
	load_file(file_group)
	load_file(file_income)
	load_file(file_hunger_fill)
	load_file(file_addiction)

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

# Getters ====================================

# Call index on Foods.txt
func _get_food_name(index_call):
	var f = File.new()
	f.open(file_foods, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	f.close()
	return "Food Name not found, invalid index"

# Call index on Foods_Hover.txt
func _get_food_hover(index_call):
	var f = File.new()
	f.open(file_food_hover, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	f.close()
	return "Food Hover not found, invalid index"

# Call index on Food_NormalReview.txt
func _get_food_norm_review(index_call):
	var f = File.new()
	f.open(file_food_norm_review, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	f.close()
	return "Food Normal Review not found, invalid index"

# Call index on Food_ZombieReview.txt
func _get_food_zomb_review(index_call):
	var f = File.new()
	f.open(file_food_zomb_review, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	f.close()
	return "Food Zombie Review not found, invalid index"

# Call index on Stage.txt
func _get_stage_index(index_call):
	var f = File.new()
	f.open(file_stage, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	f.close()
	return "Stage not found, invalid index"

# Call index on Group.txt
func _get_group_index(index_call):
	var f = File.new()
	f.open(file_group, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	f.close()
	return "Group not found, invalid index"

# Call index on HungerFill.txt
func _get_hunger_fill_index(index_call):
	var f = File.new()
	f.open(file_hunger_fill, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	f.close()
	return "Hunger fill not found, invalid index"

# Call index on Income.txt
func _get_income_index(index_call):
	var f = File.new()
	f.open(file_income, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	f.close()
	return "Income not found, invalid index"

# Call index on Addiction.txt
func _get_addiction_index(index_call):
	var f = File.new()
	f.open(file_addiction, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		if (index == index_call):
			return line
		
		index += 1
	f.close()
	return "Addiction not found, invalid index"
