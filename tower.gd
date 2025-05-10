extends CharacterBody2D
class_name Tower

const BULLET = preload("res://bullet.tscn")
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
	bullet.setup(self)
