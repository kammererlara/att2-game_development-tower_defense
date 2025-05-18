extends Area2D
class_name Bullet

@export var speed = 10
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

func _process(delta: float) -> void:
	position += direction * speed * 100 * delta

func _on_area_entered(area):
	if area is Animal:
		queue_free()
