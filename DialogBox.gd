# DialogBox.gd
extends Control

# Variables =====================================
var dialog_index = 1
var finished = false
var in_drag_response_branch = false

# Starter Functions =============================
func _ready():
	load_dialog()

func _process(delta):
	$Next_Icon.visible = finished
	
	if (finished == false):
		$Speak.play()
	else:
		$Speak.stop()
	
	#Enter key advances to next line of dialogue when finished
	if (Input.is_action_just_pressed("ui_accept") && finished == true):
		if in_drag_response_branch:
			load_drag_response()
		else:
			load_dialog()
	
	#Check branch of dialog
	branch_check()

# Functions =====================================
func branch_check():
	if get_parent().has_node("Draggable_Quest"):
		if (get_node("../Draggable_Quest").get_quest_given() && finished == true):
			dialog_index = 1
			load_drag_response()
			in_drag_response_branch = true
			get_node("../Draggable_Quest").set_quest_given(false)
			get_node("../Draggable_Quest").delete_quest()

func load_dialog():
	if (dialog_index < Dialog._get_dialog_size()):
		var Tween_linear = Tween.TRANS_LINEAR
		var Tween_ease = Tween.EASE_IN_OUT
		
		finished = false
		
		#Load dialog based on index
		$Text.bbcode_text = Dialog._get_dialog(dialog_index)
		
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
	dialog_index += 1

func load_drag_response():
	if (dialog_index < Dialog._get_drag_response_size()):
		var Tween_linear = Tween.TRANS_LINEAR
		var Tween_ease = Tween.EASE_IN_OUT
		
		finished = false
		
		#Load dialog based on index
		$Text.bbcode_text = Dialog._get_drag_response(dialog_index)
		
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
	dialog_index += 1

# Signals =======================================
func _on_Tween_tween_completed(object, key):
	finished = true
