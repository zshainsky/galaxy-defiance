class_name YellowEnemy
extends Enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	
	move_component.velocity.x = [-20, 20].pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
