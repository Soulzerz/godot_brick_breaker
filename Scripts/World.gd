extends Node2D


# Declare member variables here. Examples:
var score = 0 setget set_score


# Called when the node enters the scene tree for the first time.
func set_score(value):
	score = value
	get_node("Score").set_text("Score: " + str(score))
