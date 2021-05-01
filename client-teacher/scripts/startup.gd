extends Panel

onready var classnameInput = $newChat/Panel/chatName
onready var classInvOnly = $newChat/Panel/invonly

func _ready():
	get_parent().get_node("handler").connect_to_remote()
	$newChat.hide()
	$joinChat.hide()

func create_classroom():
	$newChat.show()
func closemodal_cc():
	$newChat.hide()

func join_classroom():
	$joinChat.show()
func closemodal_jc():
	$joinChat.hide()

#Classes
# "class_id":{
#	"name":string,
#	"students":{}, - Default blank dictionary
#	"teacher":{}, - Default blank dictionary
#	"accepting_peers":boolean,
#	"invite_only":boolean
# }

func class_create():
	if !get_tree().has_network_peer(): return
	var uniqueID = "" #TODO: generate unique IDs for chatrooms
	var data = {
		"name":classnameInput.text,
		"students":{},
		"teachers":{},
		"accepting_peers":true,
		"invite_only":classInvOnly.pressed
	}
	rpc_id(1, "chat_create", data, uniqueID)
	$newChat.hide()

func generateID() -> String:
	
	return ""
