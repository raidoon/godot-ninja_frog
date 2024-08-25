class_name MainMenu
extends Control

@onready var play_bt = $MarginContainer/buttons_containerH/buttons_containerV/play_bt as Button
@onready var options_bt = $MarginContainer/buttons_containerH/buttons_containerV/options_bt as Button
@onready var quit_bt = $MarginContainer/buttons_containerH/buttons_containerV/quit_bt as Button
@onready var options_menu = $options_menu as options_Menu
@onready var margin_container = $MarginContainer as MarginContainer

@export var starting_level = preload("res://LEVELS/level_1.tscn") as PackedScene

func _ready():
	handle_button_signals()

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(starting_level)

func on_options_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func on_quit_pressed() -> void:
	get_tree().quit()

func on_exit_options_menu()->void:
	margin_container.visible = true
	options_menu.visible = false
	options_menu.set_process(false)

func handle_button_signals() -> void:
	play_bt.button_down.connect(on_start_pressed)
	options_bt.button_down.connect(on_options_pressed)
	quit_bt.button_down.connect(on_quit_pressed)
	options_menu.exit_to_mainMenu.connect(on_exit_options_menu)
