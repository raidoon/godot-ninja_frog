extends Control

@onready var options_button: OptionButton = $HBoxContainer/optionsButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"1152 x 648" : Vector2i(1152,648),
	"1280 x 720" : Vector2i(1280,720),
	"1920 x 1080" : Vector2i(1920, 1080)
}

func _ready():
	options_button.item_selected.connect(on_resolution_selected)
	add_resolution_item()
	

func add_resolution_item() -> void:
	for i in RESOLUTION_DICTIONARY:
		options_button.add_item(i)

func on_resolution_selected(index : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
	centering_window()

#updating the window position to be in the middle after changing the resolution
func centering_window():
	var centre_screen = DisplayServer.screen_get_position() + DisplayServer.screen_get_size()/2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(centre_screen - window_size/2)
