extends Area2D
class_name Bullet

var speed = 1000
var target: Node2D
var direction: Vector2

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func setup(origin: Vector2, target_node: Node2D):
	position = origin
	target = target_node
	
	if target:
		direction = (target.global_position - origin).normalized()
		rotation = direction.angle() + deg_to_rad(270)
		#print(rotation)

func _process(delta: float) -> void:
	if is_instance_valid(target):
		position += direction * speed * delta
	else:
		queue_free()

func _on_area_entered(area):
	#if area == _tower:
		#return
	
	if area is Animal:
		queue_free()
