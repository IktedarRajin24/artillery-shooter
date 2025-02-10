extends Node

var rotation_angle: float = 0.0
var rotation_amount: float = 1.0

	
func increase_angle()-> void:
	if rotation_angle <= 90.0:
		rotation_angle += 1.0

func decrease_angle()-> void:
	if rotation_angle >= 0.0:
		rotation_angle -= 1.0
		
func get_angle()-> float:
	return rotation_angle
