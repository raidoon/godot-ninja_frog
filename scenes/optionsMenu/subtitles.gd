extends Control

@onready var state_lb: Label = $HBoxContainer/state_lb
@onready var check_button: CheckButton = $HBoxContainer/CheckButton


func _ready() -> void:
	check_button.toggled.connect(on_subtitles_toggled)

func set_label_text(bt_pressed)->void:
	if bt_pressed != true:
		state_lb.text = "Off"
	else:
		state_lb.text = "On"
	
func on_subtitles_toggled(bt_pressed: bool)->void:
	set_label_text(bt_pressed)
