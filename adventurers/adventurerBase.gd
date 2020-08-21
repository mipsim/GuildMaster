extends Node

#image
#var image = "res://Assets/Characters/chibiMouse.png"
var image = "res://icon.png"
var neutral = "res://icon.png"
var happy = "res://icon.png"
var sad = "res://icon.png"

#dialogue
var dialogue = "res://adventurers/txt/defaultText"
var questDialogue = "res://adventurers/txt/defaultQuest"
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
	get_node("/root/desk/DragTesting/DialogBox").text = "hey"
	#call dialogue parsing function 
		#for line dialogueIndex in dialogue file
	#feed this line into dialogue text box
	
	pass

func respond(questName):
	#default quest reply text
	var replyText = "ok ill take it"
	#if quest very special
	if questName == "batQuest":
		motherDead=true
		replyText = "bats? let's fuck it up ahaaa"
	
	#call function to feed replyText to dialogue chatbox

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
	pass # Replace with function body.


