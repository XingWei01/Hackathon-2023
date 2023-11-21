extends Node2D

func _ready():
	$Background.show()
	$howToPlayMenu.hide()
	$Back.hide()
	$CreditsMenu.hide()
	$BGdrop.hide()
	$InfOmonLogo2.hide()
	await get_tree().create_timer(15).timeout
	$Background.hide()
	
func _on_exit_pressed():
	get_tree().quit()



func _on_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


func _on_how_to_play_pressed():
	$Play.hide()
	$"How to play".hide()
	$Exit.hide()
	$Credits.hide()
	$Chrome.hide()
	$InfOmonLogo.hide()
	$howToPlayMenu.show()
	$BGdrop.show()
	$InfOmonLogo2.show()
	$Back.show()


func _on_back_pressed():
	$Play.show()
	$"How to play".show()
	$Exit.show()
	$Chrome.show()
	$Credits.show()
	$InfOmonLogo.show()
	$howToPlayMenu.hide()
	$CreditsMenu.hide()
	$BGdrop.hide()
	$InfOmonLogo2.hide()
	$Back.hide()


func _on_credits_pressed():
	$Play.hide()
	$"How to play".hide()
	$Exit.hide()
	$Credits.hide()
	$Chrome.hide()
	$CreditsMenu.show()
	$BGdrop.show()
	$InfOmonLogo2.show()
	$InfOmonLogo.hide()
	$howToPlayMenu.hide()
	$Back.show()
