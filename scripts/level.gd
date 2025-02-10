extends TextureRect
const CANNON_BALL = preload("res://Scenes/cannonBall/cannon_ball.tscn")

@onready var angle_label: Label = $RotationController/HBoxContainer/TextureRect/AngleLabel
@onready var cannon: RigidBody2D = $Cannon
@onready var ball_spawner_pos: Marker2D = $Cannon/ball_spawn_pos
var angle = GameManager.get_angle()

func _ready() -> void:
	SignalManager.on_angle_change.connect(on_angle_change)

func _on_increment_button_pressed() -> void:
	GameManager.increase_angle()
	angle = GameManager.get_angle()
	if(cannon.rotation_degrees<90):
		cannon.rotation_degrees += 1
		on_angle_change(cannon.rotation_degrees)
	
func _on_decrement_button_pressed() -> void:
	GameManager.decrease_angle()
	angle = GameManager.get_angle()
	if(cannon.rotation_degrees>0):
		cannon.rotation_degrees -= 1
		on_angle_change(cannon.rotation_degrees)
	

func on_angle_change(angle)-> void:
	angle_label.text = str(int(angle))


func _on_shoot_button_pressed() -> void:
	var cannon_ball = CANNON_BALL.instantiate()
	cannon_ball.position = ball_spawner_pos.global_position
	get_parent().add_child(cannon_ball)
	cannon_ball.freeze = false
	var shoot_direction = Vector2.RIGHT.rotated(cannon.rotation_degrees)
	var force = 500
	cannon_ball.apply_central_impulse(shoot_direction * force)
