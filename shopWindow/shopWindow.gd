extends Node


var currentCharacter #= scene
var characterQueue #= maybe a file contains characters for each day


func loadCharacterQueue(day):
	
	#actually set this by indexing into file
	characterQueue = "mouse, rat, dog" #this should probably be array
	for character in get_children():
		pass
		#if character.title == "baseBoy":
			#$currentCharacter.texture = load(character.image)
func nextCharacter():
	#for all children, next character = 
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	loadCharacterQueue(desk.day)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
