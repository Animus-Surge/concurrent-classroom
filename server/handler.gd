extends Node

const PORT = 37222

var classes = {}

#Classes
# "class_id":{
#	"name":string,
#	"students":{}, - Default blank dictionary
#	"teacher":{}, - Default blank dictionary
#	"accepting_peers":boolean
# }

#Optional data: "o_invite_only":<boolean:false>, "o_max_peers":<integer:-1>
remote func new_class(class_id, optional_data:Dictionary):
	classes[class_id] = {"students":{}, "moderators":{}, "accepting_peers":false, "o_max_peers":(-1 if !optional_data.has("o_max_peers") else optional_data["o_max_peers"]), "o_invite_only":(false if !optional_data.has("o_invite_only") else optional_data["o_invite_only"])}

func _ready():
	get_tree().connect("network_peer_connected", self, "_peer_connect")
	get_tree().connect("network_peer_disconnected", self, "_peer_disconnect")
	
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(PORT, 10)
	get_tree().network_peer = peer

func _peer_connect(id):
	print("Peer connected from IP " + get_tree().network_peer.get_peer_address(id))	
func _peer_disconnect(id):
	print("Peer disconnected from IP " + get_tree().network_peer.get_peer_address(id))	

remote func send_message(message): #Message is a dictionary
	print("Sending message " + message)
	rpc("recieve_message", message)

#Details are the student's name, 
remote func student_join(class_code, details):
	var id = get_tree().get_rpc_sender_id()
	
	classes[class_code].students[id] = details
	print(classes[class_code].students[id])

puppetsync func student_leave(id, server_code, details):
	pass

remote func chat_create(details, unique_code):
	classes[unique_code] = details
