extends Node

const SAVE_PATH: String = "user://tappy_save.dat"
var _score: int = 0


func save_to_file():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if !file:
		push_error("save_to_file no file found")
		return
	file.store_32(high_score)

func load_from_file():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if !file:
		push_error("save_to_file no file found")
		return
	high_score = file.get_32()


var high_score = 0


func _ready() -> void:
	load_from_file()
	SignalHub.tappy_died.connect(on_tappy_died)

func on_tappy_died():
	if _score > high_score:
		high_score = _score
		save_to_file()
	reset_score()

func reset_score():
	_score = 0
func add_point():
	_score += 1
	SignalHub.point_scored.emit(_score)
	print("%s" % _score)
