extends Node2D

const DIGIT_WIDTH = 25

func set_digit(digit):
	$DefaultDigit.set_digit(digit)
	$FlashDigit.set_digit(digit)
	
func set_color(color):
	$FlashDigit.set_color(color)

func flash():
	$AnimationPlayer.play("Flash")
