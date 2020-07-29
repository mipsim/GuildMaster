extends Control


var scene_path_to_load

# Called when the node enters the scene tree for the first time.
func _ready():
	$menu/centerRow/buttons/newGameButton.grab_focus()
	for button in $menu/centerRow/buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$fadeIn.show()
	$fadeIn.fade_in()
		


func _on_fadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
