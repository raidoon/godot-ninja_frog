extends Control

@onready var options_button = $HBoxContainer/optionsButton as OptionButton

const WINDOW_MODE_ARRAY : Array[String] = [
	"Window Mode",
	"Full-screen",
	"Borderless Window Mode",
	"Borderless Full-screen"
]

func _ready():
	add_window_mode_items()
	options_button.item_selected.connect(on_window_mode_selected)

func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		options_button.add_item(window_mode)

func on_window_mode_selected(index : int) -> void:
	match index:
		0: #window mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
		1: #Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
			#DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
		2: #borderless window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
		3: #borderless fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
