extends HSlider

@onready var music = AudioServer.get_bus_index("music")

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music,linear_to_db(value))
	AudioServer.set_bus_mute(music,value<.05)
