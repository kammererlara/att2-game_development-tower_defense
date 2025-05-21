extends CharacterBody2D
class_name Tower

const BULLET = preload("res://bullet.tscn")
var target_animal: Node2D
var cooldown = 0

@onready var control: Control = $"../.."
@onready var map: Area2D = $"../Map3"
@onready var tank_barrel: Sprite2D = $TankDarkBarrel1

func _physics_process(delta: float) -> void:
	cooldown += delta
	find_target()
	if target_animal:
		rotate_barrel_towards_target(delta)
		if cooldown > 2:
			shoot()
			cooldown = 0
	
func shoot():
	var bullet = BULLET.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.position = self.position
	bullet.setup(self.global_position, target_animal)
	bullet.global_position = global_position

func find_target():
	var overlapping_areas = map.get_overlapping_areas()
	for area in overlapping_areas:
		if area is Animal:
			target_animal = area
			return

func rotate_barrel_towards_target(delta):
	if not tank_barrel or not target_animal:
		return

	var direction_to_target = (target_animal.global_position - tank_barrel.global_position).normalized()
	var target_angle = direction_to_target.angle() + deg_to_rad(270) # +90 Grad, wenn 0 Grad nach rechts zeigt und Rohr nach oben
	var rotation_speed = 5.0 # Anpassen für schnellere/langsamere Drehung
	tank_barrel.rotation = lerp_angle(tank_barrel.rotation, target_angle, delta * rotation_speed)
