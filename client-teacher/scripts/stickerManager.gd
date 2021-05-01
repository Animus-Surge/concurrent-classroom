extends Panel

onready var stickerScript = preload("res://scripts/sticker.gd")

onready var stroot = $ScrollContainer/GridContainer

func _ready():
	var stData = File.new()
	var err = stData.open("res://data/stickerData.json", File.READ)
	if err == OK:
		var data = JSON.parse(stData.get_as_text()).result
		for sticker in data:
			var st = TextureButton.new()
			st.set_script(stickerScript)
			st.texture_normal = load(sticker.stickerTexture)
			st.set("stickerID", sticker.stickerID)
			st.set("stickerPrefix", sticker.chatPrefix)
			stroot.add_child(st)
		return
	printerr("Sticker data file does not exist.")
