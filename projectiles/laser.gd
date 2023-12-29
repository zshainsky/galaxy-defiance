extends Node2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D as VisibleOnScreenNotifier2D
@onready var ttl_timer: Timer = $TtlTimer as Timer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent as FlashComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent as HitboxComponent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Work around because VisibleOnScreenNotifier2D is not working
	ttl_timer.timeout.connect(queue_free)
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	scale_component.tween_scale()
	flash_component.flash()
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
