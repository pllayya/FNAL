extends Sprite2D

var speed = 400
var angular_speed = PI
var direction = 0

func _process(delta):
	rotation += angular_speed * direction * delta
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.DOWN.rotated(rotation) * speed
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2.LEFT.rotated(rotation) * speed
	if Input.is_action_pressed("ui_right"):
		velocity = Vector2.RIGHT.rotated(rotation) * speed
		
	position += velocity * delta
	
	
			
		
	

func _on_button_pressed():
	set_process(not is_processing())

func _on_move_pressed() -> void:
	var rng = RandomNumberGenerator.new()
	var movechance = rng.randf_range(0, 1)
	var velocity = Vector2.ZERO
	
	print(movechance)
	rotation += angular_speed * direction * movechance
	
	if movechance < 0.5:
		velocity = Vector2.UP.rotated(rotation) * speed
		position += velocity * 0.1
	
	if movechance > 0.5:
		velocity = Vector2.DOWN.rotated(rotation) * speed
		position += velocity * 0.1
	
	
	
	
