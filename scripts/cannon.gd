extends RigidBody2D

var rotation_amount = GameManager.rotation_amount
var angle = GameManager.get_angle()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotation += -rotation_amount * delta
		SignalManager.on_angle_change.emit(self.rotation_degrees)
	if Input.is_action_pressed("right"):
		rotation += rotation_amount * delta
		SignalManager.on_angle_change.emit(self.rotation_degrees)
		
	rotation = clamp(rotation, 0, deg_to_rad(90))
