extends Node

signal tappy_died
signal point_scored(score: int)

func emit_tappy_died():
	tappy_died.emit()

func emit_point_scored(score: int):
	point_scored.emit(score)
