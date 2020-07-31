extends RigidBody2D

const SPEEDUP = 4
const MAXSPEED = 400

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_node("/root/World").score += 5
			body.queue_free()
		
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = position - body.get_node("Anchor").get_global_position()
			var velocity = direction.normalized() * min(speed + SPEEDUP, MAXSPEED)
			set_linear_velocity(velocity)

	if position.y > get_viewport_rect().end.y:
		print("Ball died.")
		queue_free()
