extends Area2D
class_name Bullet

var speed = 8
#var _rotation = deg_to_rad(180)
var target: Node2D

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func setup(origin: Vector2, target_node: Node2D):
	position = origin
	target = target_node
	
	var direction_to_target = (target.global_position - self.global_position).normalized()
	rotation = direction_to_target.angle()

func _process(delta: float) -> void:
	if is_instance_valid(target):
		var direction = (target.global_position - self.global_position).normalized()
		position += direction * speed * delta
	else:
		queue_free()

func _on_area_entered(area):
	#if area == _tower:
		#return
	
	if area is Animal:
		queue_free()
