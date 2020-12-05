extends Node2D


var score = 0
var digit1
var digit2
var Digit = preload("res://FlashDigit.tscn")
export var color = "green"

func _ready():
	digit1 = Digit.instance()
	digit1.position.x = -digit1.DIGIT_WIDTH
	digit1.set_color(color)
	add_child(digit1)
	digit2 = Digit.instance()
	digit2.set_color(color)
	digit2.position.x = digit1.DIGIT_WIDTH
	add_child(digit2)
	
	set_score(score, false)

func set_score(new_score, flash=false):
	score = clamp(new_score, 0, 99)
	digit1.set_digit(ceil(score/10))
	digit2.set_digit(ceil(score%10))
	if flash:
		digit1.flash()
		digit2.flash()
