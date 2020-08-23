extends Node

#image
#var image = "res://Assets/Characters/chibiMouse.png"
var image = "res://icon.png"
var neutral = "res://icon.png"
var happy = "res://icon.png"
var sad = "res://icon.png"

#dialogue
#onready var dialogue = 'res://txt/Dialogue.txt'
onready var dialogue = 'res://adventurers/adventureTxt/DogChat.txt'
#onready var questDialogue = 'res://txt/Drag_ResponseTest.txt'
onready var questDialogue = 'res://adventurers/adventureTxt/DogQuest.txt'
var dialogueIndex = 0
#dialogue flags
var motherDead = false
var armFellOff = false

#questing

#character flags
var title = "default"
var dead = false
#stats
var strength = 3
var speed = 2
var spice = 4

#Node overload function to parse children correctly
func get_class():
	return "adventurer"


func speak():
	dialogueIndex = dialogueIndex+1
	checkFlags()
	var dialog = get_tree().get_root().get_node("desk/DragTesting/DialogBox")
	dialog.set_dialog(dialogue)
	dialog.load_dialog()
	#call dialogue parsing function 
		#for line dialogueIndex in dialogue file
	#feed this line into dialogue text box
	pass

func respond(questIndex):
	#respond to the quest index
	#send this info to the dialogBox
	#call function to feed replyText to dialogue chatbox
	var dialog = get_tree().get_root().get_node("desk/DragTesting/DialogBox")
	dialog.set_dialog(questDialogue)
	
	#dialog.load_dialog(questIndex, true)
	dialog.load_dialog()
	#default quest reply text
	var replyText = "ok ill take it"
	#if quest very special
	if questIndex == "batQuest Index":
		motherDead=true
		replyText = "bats? let's tt up ahaaa"
	

func checkFlags():
	if dialogueIndex == 4:
		if motherDead == true:
			#maybe only check on day start!!!!
			#only choose a line from this dialogue somehow
			#dialogue = "res://adventurers/txt/motherDeadTree"
			#dialogueIndex = 0
			pass
		
func checkDayFlags():
	if armFellOff == true:
		#maybe only check on day start!!!!
		dialogue = "res://adventurers/txt/motherDeadTree"
		#dialogueIndex = 0
		pass



# Called when the node enters the scene tree for the first time.
func _ready():
	#load_file(dialogue)
	#load_file(questDialogue)
	pass # Replace with function body.


