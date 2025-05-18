extends Area2D
class_name Animal

@export var speed: float = 2 
@export var lives: int = 1

var progress: float = 0.0
@onready var path_2d: Path2D = $"../Map3/Path2D"
@onready var path_follow_2d: PathFollow2D = $"../Map3/Path2D/PathFollow2D"

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	progress += delta * speed * 100000.0 / path_2d.curve.get_baked_length()
	progress = clamp(progress, 0.0, path_2d.curve.get_baked_length())
	path_follow_2d.progress = progress
	position = path_follow_2d.position

func _on_area_entered(area):	
	if area is Bullet:
		lives -= 1
		if lives == 0:
		#audio.play()
		#hide()
		#await audio.finished
		#await get_tree().create_timer(1).timeout	#warten zum löschen
			queue_free()
		#print('Hit')
