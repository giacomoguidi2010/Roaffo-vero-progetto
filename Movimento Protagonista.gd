extends CharacterBody2D

@export var speed: float = 300.0
@export var jump_speed: float = 500.0
@export var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
    var direction := Vector2.ZERO

    # Movimento orizzontale con A / D
    if Input.is_action_pressed("ui_left") or Input.is_key_pressed(Key.A):
        direction.x -= 1
    if Input.is_action_pressed("ui_right") or Input.is_key_pressed(Key.D):
        direction.x += 1

    velocity.x = direction.x * speed

    # Salto con Space/accept
    if is_on_floor() and (Input.is_action_just_pressed("ui_accept") or Input.is_key_pressed(Key.SPACE)):
        velocity.y = -jump_speed

    # Gravità semplice
    if not is_on_floor():
        velocity.y += gravity * delta

    velocity = move_and_slide()
