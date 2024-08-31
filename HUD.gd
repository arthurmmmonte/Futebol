extends CanvasLayer

# Notifies 'Main' node that the button has been pressed
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_goal(team_id):
	$Message.text = "Gol do time %d" % [team_id]

func update_score(score1, score2):
	$ScoreLabel.text = "%d - %d" % [score1, score2]

func show_game_over(team_id):
	show_message("Fim de Jogo\nTime %d ganhou!" % [team_id])
	await $MessageTimer.timeout
	
	$Message.text = ""
	$Message.hide()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
