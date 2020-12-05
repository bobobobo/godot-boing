
extends AudioStreamPlayer2D

var sounds =  {}

func add_sound(name, files):
	var streams = []
	for file_name in files:
		var loaded_stream = load(file_name)	
		loaded_stream.set_loop(false)
		streams.append(loaded_stream)
	sounds[name] = streams
	
func play_sound(name):
	if !sounds[name]:
		return
	stream = sounds[name][randi() % sounds[name].size()]
	play()

func play(from_position=0.0):
	var asp = self.duplicate(DUPLICATE_USE_INSTANCING)
	get_parent().add_child(asp)
	asp.stream = stream
	asp.play()
	yield(asp, "finished")
	asp.queue_free()
