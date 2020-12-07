extends AnimatedSprite

var fsm
var target

func _ready():
	hide()
	
func enter(fsm, target):
	self.fsm = fsm
	self.target = target
	show()
	
func process(delta):
	if Input.is_action_just_pressed("player1_up") || Input.is_action_just_pressed("player2_up"):  
		set_frame(0)
	if Input.is_action_just_pressed("player1_down") || Input.is_action_just_pressed("player2_down"):
		set_frame(1)
	if Input.is_action_just_pressed("ui_accept"):
		target.number_of_players = get_frame() + 1
		hide()
		fsm.transition_to("Game")
