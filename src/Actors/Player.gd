extends Actor

export var stomp_impulse: = 600.0
var pos = []

func _on_StompDetector_area_entered(area):
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)

func _on_EnemyDetector_body_entered(body):
	die()

func _physics_process(delta):
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	
	if get_direction().length() > 0:
		$Sprite.animation = "Running"
		$Sprite.flip_h = _velocity.x < 0
	else:
		$Sprite.animation = "Idle"
	
	var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	_velocity = move_and_slide_with_snap(_velocity, snap, FLOOR_NORMAL, true)


func get_direction() -> Vector2:
	return Vector2(
					Input.get_action_strength("right")-Input.get_action_strength("left"),
					-Input.get_action_strength("jump")
					if
						is_on_floor() and Input.is_action_just_pressed("jump")
					else
						0.0
					)

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var velocity: = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		$Jump.play()
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		velocity.y = 0.0
	return velocity

func calculate_stomp_velocity(linear_velocity: Vector2, stomp_impulse) -> Vector2:
	var stomp_jump: = -speed.y if Input.is_action_pressed("jump") else -stomp_impulse
	$Jump.play()
	return Vector2(linear_velocity.x, stomp_jump)

func die():
	PlayerData.deaths += 1
	queue_free()

func start():
	$Sprite.animation = "Idle"

func _process(delta):
	pos.append(position.y)
	for i in range(5,len(pos)):
		var temp = abs(pos[i-5] - pos[i])
		if is_on_floor():
			if temp > 150:
				die()
