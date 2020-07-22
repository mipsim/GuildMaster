# DialogBox.gd
extends Control

# Variables =====================================
var dialog_index = 1
var finished = false

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
		load_dialog()

# Functions =====================================
func load_dialog():
	if (dialog_index < Dialog._get_txt_size()):
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
		queue_free()
	
	#Move to next line of dialog
	dialog_index += 1

# Signals =======================================
func _on_Tween_tween_completed(object, key):
	finished = true
