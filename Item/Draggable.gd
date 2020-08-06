#Draggable.gd
extends Node2D

# Variables ==========
var selected = false
var rest_point
var init_rest_point = 0 #index based on number of quests, 
var rest_nodes = []
var new_quest = load("res://Item/Draggable_Quest.tscn")
var num_quests = 0
var max_quests = 5
var quest_given = false
var mouseover = false

# Functions ==========
func get_quest_given():
	return quest_given

func set_quest_given(new):
	quest_given = new

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	
	#Place quest in intial zone position ===
	rest_point = rest_nodes[0].global_position #Set position to first DropZone
	
	#Workbench:
	#for loop intended to create 5 quests in 5 unique starting poistions
	#should this be in the Table scene so that it can spawn the quests?
	#for x in rest_nodes.size():
	#	if x == max_quests:
	#		break
	#	else:
	#		get_tree().get_root().add_child(new_quest.instance())
	#		rest_point = rest_nodes[init_rest_point].global_position
	#	
	#	num_quests += 1 #DELETEME
	#	print( #DELETEME
	#		"My quest num is: " + str(num_quests) + "\nI am at: " + str(rest_point) + "\n"
	#	) 
	#	
	#	init_rest_point += 1
	
	#Default DropZone Selection ===
	#rest_nodes[0].select()

func _physics_process(delta):
	if selected:
		global_position = lerp(
			global_position, get_global_mouse_position(), 25 * delta
		)
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)

func _input(event):
	if event is InputEventMouseButton and mouseover:
		# if player double clicks on Item
		if event.doubleclick:
			var load_page = load("res://Pages/questBase.tscn").instance()
			get_tree().get_root().add_child(load_page)
		
		# if player releases Left Mouse Button
		if event.button_index == BUTTON_LEFT and not event.pressed:
			# if player releases drag in DropZone_Adventurer
			if get_node("../DropZone_Adventurer").get_area_entered() == true:
				quest_given = true
			
			selected = false
			var shortest_dist = 300 #length of draw() from DropZone.gd to snap
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					child.select()
					rest_point = child.global_position
					shortest_dist = distance
			print("quest_given: " + str(get_quest_given())) #DELETEME

func delete_quest():
	queue_free()

# Signals ============
func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true

func _on_Area2D_mouse_entered():
	mouseover = true

func _on_Area2D_mouse_exited():
	mouseover = false
