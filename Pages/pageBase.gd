#pageBase.gd
extends Control

func _ready():
	displayText()

func displayText():
	# Check if loading pageBase ============
	if $Container/Background/VBox/pageName.text == "pageName":
		$Container/Background/VBox/pageName.text = "pageName"
	
	if $Container/Background/VBox/pageText.text == "pageText":
		$Container/Background/VBox/pageText.text = "pageText"
	
	# Check if loading questBase ============
	if $Container/Background/VBox/pageName.text == "Quest":
		$Container/Background/VBox/pageText.text = "Quest Title"
	
	if $Container/Background/VBox/pageName.text == "questText":
		$Container/Background/VBox/pageText.text = "Quest Details"


func displayImage():
	$Container/Background/VBox/pageImage.play("Default")

func _on_exitPage_pressed():
	queue_free()
