extends Sprite

var fsm

func _ready():
	hide()
	
func enter(fsm, _target):
	self.fsm = fsm
	show()

func process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		hide()
		fsm.transition_to("MainMenu")
