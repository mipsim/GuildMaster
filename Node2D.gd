extends Node2D


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _process(delta):
	self.position = self.get_global_mouse_position()
	
	if Input.is_action_just_pressed("click"):
		$ClickSound.play()

