extends Node2D

var board ={1:"",2:"",3:"",4:"",5:"",6:"",7:"",8:"",9:""}

@export var X : Texture2D
@export var O : Texture2D

func check_winner() :
	if(board[1] == board [2] and board [2] == board [3]):
		ClientSide.Send("W,"+board[1])
	if(board[4] == board [5] and board [5]== board [6]) :
		ClientSide.Send("W,"+board[4])
	if(board[7] == board [8]and board [8] == board [9]) :
		ClientSide.Send("W,"+board[7])
	if(board[1] == board [4] and board [4]== board [7]) :
		ClientSide.Send("W,"+board[1])
	if(board[2] == board [5]and board [5] == board [8]) :
		ClientSide.Send("W,"+board[2])
	if(board[3] == board [6] and board [6]== board [9]) :
		ClientSide.Send("W,"+board[3])
	if(board[1] == board [5]and board [5] == board [9]) :
		ClientSide.Send("W,"+board[1])
	if(board[3] == board [5] and board [5] == board [7]):
		ClientSide.Send("W,"+board[3])
	if( board[1] != "" and board[2] != "" and board[3] != "" and board[4] != "" and board[5] != "" and board[6] != "" and board[7] != "" and board[8] != "" and board[9] != "" ):
		ClientSide.Send("W,Draw")

func _ready() -> void:
	ClientSide.Send("GN")
	pass

func try_make_move(pos:int):
	if ClientSide.isMyTurn:
		if board[pos]=="":
			if ClientSide.isX:
				make_move(pos,"X")
			else:
				make_move(pos,"O")
	

func make_move(pos:int,turn: String):
	var area=get_child(pos)
	ClientSide.isMyTurn = !ClientSide.isMyTurn
	if turn=="X":
		board[pos]="X"
		area.get_node("Sprite").texture=X
	else:
		board[pos]="O"
		area.get_node("Sprite").texture=O
	ClientSide.Send("MM,"+str(pos)+","+turn)

func make_move_opponent(pos:int,turn: String):
	var area=get_child(pos)
	ClientSide.isMyTurn = !ClientSide.isMyTurn
	if turn=="X":
		board[pos]="X"
		area.get_node("Sprite").texture=X
	else:
		board[pos]="O"
		area.get_node("Sprite").texture=O
	check_winner()

func setNames(my: String, opp: String):
	$Username.text = my
	$Opponentname.text = opp

func setWinner(win: String):
	if win == "Draw":
		$Winner.text= "It is a draw!"
	else:
		$Winner.text= win + " is a winner!"
	$Winner.visible = true
	$GoBack.visible = true
	$GoBack.disabled = false
	ClientSide.socketReady = false


func event_handler(event:InputEvent,pos:int):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			try_make_move(pos)

func _on_area_1_input_event(viewport, event, shape_idx):
	event_handler(event,1)


func _on_area_2_input_event(viewport, event, shape_idx):
	event_handler(event,2)


func _on_area_3_input_event(viewport, event, shape_idx):
	event_handler(event,3)


func _on_area_4_input_event(viewport, event, shape_idx):
	event_handler(event,4)


func _on_area_5_input_event(viewport, event, shape_idx):
	event_handler(event,5)


func _on_area_6_input_event(viewport, event, shape_idx):
	event_handler(event,6)


func _on_area_7_input_event(viewport, event, shape_idx):
	event_handler(event,7)


func _on_area_8_input_event(viewport, event, shape_idx):
	event_handler(event,8)


func _on_area_9_input_event(viewport, event, shape_idx):
	event_handler(event,9)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
