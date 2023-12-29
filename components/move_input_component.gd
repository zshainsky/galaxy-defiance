class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent
@export var move_stats: MoveStats

func _input(event: InputEvent):
	var input_axis = Input.get_axis("ui_left", "ui_right")
	move_component.velocity = Vector2(move_stats.speed * input_axis, 0)
