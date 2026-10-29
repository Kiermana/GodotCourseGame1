extends Node

const LOADING_SCREEN = preload("uid://bhxftix62he46")

var GAME = load("uid://5crko5fko6fx")
var MAIN = load("uid://dp8sqrwh8i225")

#region Original
#func load_game_screen():
		#get_tree().change_scene_to_packed(GAME)
		#
#func load_main_screen():
	#get_tree().change_scene_to_packed(MAIN)

#endregion

#region SimpleChange

var _next_scene: PackedScene

func change_to_next():
	get_tree().change_scene_to_packed(_next_scene)


func load_game_screen():
	_next_scene = GAME
	get_tree().change_scene_to_packed(LOADING_SCREEN)

func load_main_screen():
	_next_scene = MAIN
	get_tree().change_scene_to_packed(LOADING_SCREEN)
#endregion
