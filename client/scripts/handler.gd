extends Node

func _ready():
	get_tree().connect("network_peer_connected", self, "client_join")
	get_tree().connect("network_peer_disconnected", self, "client_quit")
	
	get_tree().connect("connected_to_server", self, "joined")
	get_tree().connect("connection_failed", self, "failed")
	get_tree().connect("server_disconnected", self, "disconnected")

const IP = "127.0.0.1"
const PORT = 37222

#TEMPORARY
const details = {"name_first":"John", "name_last":"Doe"}

var students = {}

func connect_to_remote():
	print("Connecting to server " + IP + ":" + str(PORT))
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(IP, PORT)
	get_tree().network_peer = peer

#All serverside logging happens in the server and gets logged to files

func client_join(id):
	pass
func client_quit(id):
	pass

func joined():
	print("Connected to remote.")
func errored():
	print("Could not connect to remote")
func disconnected():
	print("Disconnected from remote")

func join_class(class_id):
	rpc_id(1, "student_join", class_id, details)

remote func register_peer(id, data):
	pass

remote func unregister_peer(id):
	pass

remote func recieve_message(message):
	pass
