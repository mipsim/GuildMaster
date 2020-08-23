extends Node


var currentCharacter #= scene
var characterList #= maybe a file contains characters for each day
var charQueue = Array()

func loadCharacterQueue(day):
	
	#actually set this by indexing into file
	characterList = "hunterCat students rat smugCat veteranDog default" #this should probably be array
	for character in get_children():
		if character.get_class() == "adventurer":
			if character.title in characterList:
				charQueue.append(character)
				
	
	nextCharacter()
func nextCharacter():
	currentCharacter = charQueue.pop_front()
	currentCharacter.speak()
	if (currentCharacter!=null):
		#$currentCharacter.texture = null
		$currentCharacter.set_texture(load(currentCharacter.image))
		$currentExpression.set_texture(load(currentCharacter.neutral))

# Called when the node enters the scene tree for the first time.
func _ready():
	loadCharacterQueue(desk.day)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setExpression(newExpression):
	if newExpression == "happy":
		$currentExpression.set_texture(load(currentCharacter.happy))

func _on_Button_pressed():
	nextCharacter()
	
