extends Area2D
class_name Animal

var speed = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	position.x -= speed

func _on_area_entered(area):
	print('Hit')
	
	if area is Bullet:		
		#audio.play()
		#hide()
		#await audio.finished
		#await get_tree().create_timer(1).timeout	#warten zum löschen
		queue_free()
