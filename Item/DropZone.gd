#DropZone.gd
extends Position2D

func _draw():
	#draw_circle(Vector2.ZERO, 75, Color.blanchedalmond) #From Tutorial
	#draw_rect(Rect2(Vector2(center position), Vector2(dimensions)), color)
	draw_rect(Rect2(Vector2(-55, -55), Vector2(110, 110)), Color.blanchedalmond)

func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
		
		modulate = Color.webmaroon

func deselect():
	modulate = Color.white
