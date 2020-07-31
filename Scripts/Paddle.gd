extends KinematicBody2D

const  BALL_SCENE = preload("res://Mini Scenes/Ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_physics_process(true)
	set_process_input(true)

func _physics_process(delta):
	var y = position.y
	var mouse_x = get_viewport().get_mouse_position().x
	position = Vector2(mouse_x, y)
	
func _input(event):
	if event is InputEventMouseButton && event.is_pressed():
		var ball = BALL_SCENE.instance()
		ball.position = ball.position - Vector2(0, 16)
		get_tree().get_root().add_child(ball)
