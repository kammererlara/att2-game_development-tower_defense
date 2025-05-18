extends Node2D

var tower_scene: PackedScene = preload("res://tower.tscn")
var monkey_scene: PackedScene = preload("res://monkey.tscn")
var elephant_scene: PackedScene = preload("res://elephant.tscn")

@onready var game: Node2D = $"."
@onready var spawn_timer: Timer = $SpawnTimer
@onready var elephant_spawn_timer: Timer = $ElephantSpawnTimer

var current_wave: int = 0
var animals_in_wave: int = 0
var start_spawning_elephants: bool = false

func _ready() -> void:
	var tower_instance = tower_scene.instantiate()
	add_child(tower_instance)
	tower_instance.position = Vector2(100, 100)
	
	spawn_timer.start()
	elephant_spawn_timer.start()

func _on_elephant_spawn_timer_timeout() -> void:
	start_spawning_elephants = true

func _on_spawn_timer_timeout() -> void:
	var data = retrieve_spawning_animaldata()
	spawn_animals(data)
	spawn_timer.start()

func spawn_animals(data):
	print(data)
	for animal in data:
		var new_animal
		if animal[0] == "Monkey":
			print('Instantiate Monkey...')
			new_animal = monkey_scene.instantiate()
		elif animal[0] == "Elephant":
			print('Instantiate Elephant...')
			new_animal = elephant_scene.instantiate()
		
		game.add_child(new_animal, true)
		await get_tree().create_timer(animal[1]).timeout

func retrieve_spawning_animaldata():
	var data = [["Monkey", 0.7]]
	if start_spawning_elephants:
		data.append(["Elephant", 0.1])
	current_wave += 1
	animals_in_wave = data.size()
	return data
