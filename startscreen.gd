extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(_on_play_button_pressed)


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://gameUi.tscn")
