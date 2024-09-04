extends HSlider
#EZ A MAIN VOLUME SLIDER !!!!!
@export
var bus_name: String
var bus_index: int

func _ready()->void:
	bus_index=AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_h_slider_value_changed)


func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index,linear_to_db(value))

#HIBA: INDEXNEK NINCS DEF ÉRTÉKE, AHOGY A BUS_NAME-NEK SEM, EZÉRT AD VISSZA -1-ET
