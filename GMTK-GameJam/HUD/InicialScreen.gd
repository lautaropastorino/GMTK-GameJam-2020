extends CanvasLayer



func _on_PlayButton_pressed():
	get_tree().change_scene("res://Levels/Cave.tscn")
	



func _on_ExitButton_pressed():
	get_tree().quit()
