class_name SpaceBackground
extends ParallaxBackground

@onready var space_layer: ParallaxLayer = %SpaceLayer as ParallaxLayer
@onready var far_stars_layer: ParallaxLayer = %FarStarsLayer as ParallaxLayer
@onready var close_stars_layer: ParallaxLayer = %CloseStarsLayer as ParallaxLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	space_layer.motion_offset.y += 2 * delta
	far_stars_layer.motion_offset.y += 5 * delta
	close_stars_layer.motion_offset.y += 20 * delta

