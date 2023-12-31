class_name Enemy
extends Node2D

@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var stats_component: StatsComponent = $StatsComponent as StatsComponent
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent as FlashComponent
@onready var shake_component: ShakeComponent = $ShakeComponent as ShakeComponent
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D as VisibleOnScreenNotifier2D
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent as HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent as HitboxComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent as DestroyedComponent
@onready var score_component: ScoreComponent = $ScoreComponent as ScoreComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hurtbox_component.hurt.connect(func(hitbox_component): 
		enemy_hit()
	)
	hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1))
	stats_component.no_health.connect(queue_free)
	stats_component.no_health.connect(func():
		score_component.adjust_score()
	)
	
func enemy_hit() -> void:
	scale_component.tween_scale()
	flash_component.flash()
	shake_component.tween_shake()
	

