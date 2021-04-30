extends Panel

onready var errorLabel = $errLabel
onready var codeInput = $codeInput

func _ready():
	get_parent().get_node("handler").connect_to_remote()
	

func join():
	pass # Replace with function body.
