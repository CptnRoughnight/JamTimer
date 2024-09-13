extends Panel


var following = false
var draggin_start_position = Vector2i()


func _ready() -> void:
	pass # Replace with function body.



func _process(_delta: float) -> void:
	if following:
		var mp := Vector2i(get_global_mouse_position().x,get_global_mouse_position().y)
		DisplayServer.window_set_position(DisplayServer.window_get_position()-draggin_start_position+mp,0)
	#get_window().position =  (get_global_mouse_position() - draggin_start_position)


func _on_gui_input(event:InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and event.pressed == true:
			print("pressed");
			following = !following

			draggin_start_position = Vector2i(get_global_mouse_position().x,get_global_mouse_position().y)
