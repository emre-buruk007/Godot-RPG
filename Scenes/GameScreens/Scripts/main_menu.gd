extends CanvasLayer
@onready var audio_stream_player = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	audio_stream_player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/Maps/world_1.tscn")


func _on_button_load_game_pressed():
	pass # Replace with function body.


func _on_button_options_pressed():
	pass # Replace with function body.


func _on_button_quit_pressed():
	get_tree().quit()
