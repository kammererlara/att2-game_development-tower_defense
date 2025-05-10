extends CharacterBody2D
class_name Tower

const BULLET = preload("res://bullet.tscn")
var target_animal: Node2D
var cooldown = 0

func _physics_process(delta: float) -> void:
	cooldown += delta
	if cooldown > 1:
		shoot()
		cooldown = 0
	
func shoot():
	var bullet = BULLET.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.position = self.position
	bullet.setup(self.global_position, target_animal)
	bullet.global_position = global_position

#func find_target():
	#var overlapping_areas = map.get_overlapping_areas()
	#for area in overlapping_areas:
		#if area is Animal:
			#target_animal = area
			#return
