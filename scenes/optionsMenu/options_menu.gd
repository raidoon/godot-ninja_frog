class_name options_Menu
extends Control

@onready var exit_bt = $MarginContainer/VBoxContainer/exit_bt as Button

signal exit_to_mainMenu

func _ready():
	exit_bt.button_down.connect(on_exit_pressed)
	set_process(false)

func on_exit_pressed() -> void:
	exit_to_mainMenu.emit()
	set_process(false)
