extends Area2D
class_name Bullet

var speed = 8
var _rotation = deg_to_rad(180)
var _tower

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func setup(tower):
	_tower = tower
	rotate(_rotation)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed

func _on_area_entered(area):
	if area == _tower:
		return
	
	if area is Animal:
		queue_free()
