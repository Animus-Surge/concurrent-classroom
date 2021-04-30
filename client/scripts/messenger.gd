extends Panel

onready var messagePrefab = preload("res://prefabs/message.tscn")
onready var stickerPrefab = preload("res://prefabs/sticker.tscn")

onready var chatRoot = $chatPanel/ScrollContainer/GridContainer

onready var stickerPanel = $stickerPanel

onready var sendButton = $messagePanel/sendbtn
onready var stickerBtn = $messagePanel/stickerButton
onready var messageInput = $messagePanel/textInput

func _ready():
	stickerPanel.hide()
	sendButton.disabled = true

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ENTER:
			if !messageInput.text.empty():
				_message_send()

func _process(_delta):
	sendButton.disabled = messageInput.text.empty()

func _message_send():
	pass

func _sticker_panel_toggle(button_pressed):
	pass
