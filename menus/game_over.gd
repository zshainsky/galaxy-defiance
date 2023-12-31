extends Control
class_name GameOverMenu

@export var game_stats: GameStats

@onready var score_value: Label = %ScoreValue as Label
@onready var high_score_value: Label = %HighScoreValue as Label

func _ready():
	if game_stats.score > game_stats.high_score:
		game_stats.high_score = game_stats.score
		
	score_value.text = str(game_stats.score)
	high_score_value.text = str(game_stats.high_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://menus/menu.tscn")
		
		# Reset score to zero for a new game
		game_stats.score = 0 
