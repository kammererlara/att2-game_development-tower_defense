extends Node2D

var tower_scene: PackedScene = preload("res://tower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tower_instance = tower_scene.instantiate()
	add_child(tower_instance)
	tower_instance.position = Vector2(100, 100)
