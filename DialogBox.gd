# DialogBox.gd
extends Control

# Variables =====================================
# TO BE PHASED OUT JUST PLACEHOLDER
var dialog_txt = 'res://txt/Dialogue.txt'
var drag_response_txt = 'res://txt/Drag_ResponseTest.txt'

#file is the current text file being read, make sure to set
var file

var dialog_index = 1
var finished = false

#for clicking on
var mouseOver = false

# Starter Functions =============================
	
func _process(delta):
	$Next_Icon.visible = finished
	
	if (finished == false):
		$Speak.play()
	else:
		$Speak.stop()
	
	#Enter key advances to next line of dialogue when finished
	if (Input.is_action_just_pressed("ui_accept") && finished == true) or (mouseOver==true && Input.is_action_just_pressed("click")):
		load_dialog()
	
	#Check branch of dialog
	#branch_check()

# Functions =====================================

func set_dialog(fileIn):
	dialog_index = 1
	file = fileIn

#func load_dialog(index, quest):
func load_dialog():
	#make sure nothing preventing next part being loaded
	if !desk.DE && !desk.GQ:
		#read the dialog
		Dialog.load_file(file)
		#load in the adventurer index
		var shopWindow = get_tree().get_root().get_node("desk/shopWindow")
		var dialog_index = shopWindow.currentCharacter.dialogueIndex
		
		if (dialog_index < Dialog._get_dialog_size()):
			var Tween_linear = Tween.TRANS_LINEAR
			var Tween_ease = Tween.EASE_IN_OUT
			
			finished = false
			
			#Load dialog based on index
			var currentLine = Dialog._get_dialog(dialog_index)
			if "[GQ]" in currentLine:
				desk.GQ = true
				currentLine = currentLine.substr(5)
				print("give quest!")
			if "[DE]" in currentLine:
				desk.DE = true
				currentLine = currentLine.substr(5)
				print("day end!")
			$Text.bbcode_text = currentLine
			
			#Animate dialog reveal
			$Text.percent_visible = 0
			$Tween.interpolate_property(
				$Text, "percent_visible", 0, 1, 0.8, Tween_linear, Tween_ease
			)
			$Tween.start()
		else:
			#Deletes dialog box if no more text available
			#queue_free()
			pass
		
		#Move to next line of dialog
		#if text is too big maybe don't increment index and set a 
		#temp BIG flag and in middle index of flag to know to first 
		#finish displaying current line
		
		#if quest == false:
		shopWindow.currentCharacter.dialogueIndex += 1


# Signals =======================================
func _on_Tween_tween_completed(object, key):
	finished = true

func _on_TextureRect_mouse_entered():
	mouseOver = true
	
func _on_TextureRect_mouse_exited():
	mouseOver = false
