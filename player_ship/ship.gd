extends Node2D

@onready var left_muzzle: Marker2D = $LeftMuzzle as Marker2D
@onready var right_muzzle: Marker2D = $RightMuzzle as Marker2D
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer as Timer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $Anchor/AnimatedSprite2D as AnimatedSprite2D
@onready var flame_animated_sprite: AnimatedSprite2D = $Anchor/FlameAnimatedSprite as AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lasers)

func _process(delta: float) -> void:
	animate_the_ship()
	
func fire_lasers() -> void:
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()

func animate_the_ship() -> void:
	var animation_dir: String = "center"
	if move_component.velocity.x < 0:
		animation_dir = "bank_left"
	elif move_component.velocity.x > 0:
		animation_dir = "bank_right"
	
	animated_sprite_2d.play(animation_dir)
	flame_animated_sprite.play(animation_dir)
	
