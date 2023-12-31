extends Node2D

@export var game_stats: GameStats

@onready var ship: Node2D = $Ship as Node2D
@onready var score_label: Label = $ScoreLabel as Label

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set starting score
	update_score_label(game_stats.score)
	game_stats.score_changed.connect(update_score_label)
	
	ship.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://menus/game_over.tscn")
	)
	
func update_score_label(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)
	
