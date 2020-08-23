#DropZone_Adventurer.gd
extends Position2D

# Variables ==========
#check to see if will snap here or now
var adventurer = true

var area_entered = false

# Functions ==========
func get_area_entered(): #called in Draggable.gd
	return area_entered

func _draw():
	#draw_circle(Vector2.ZERO, 75, Color.blanchedalmond) #From Tutorial
	draw_rect(Rect2(Vector2(-250, -300), Vector2(500, 600)), Color.blanchedalmond)

func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
		
		modulate = Color.webmaroon

func deselect():
	modulate = Color.white

# Signals ============
func _on_Area2D_area_entered(area):
	area_entered = true

func _on_Area2D_area_exited(area):
	area_entered = false
