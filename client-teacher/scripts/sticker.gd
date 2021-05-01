extends TextureButton

var stickerID #i.e. st:star
var stickerPrefix #i.e. :star:

signal stickerPressed(stickerID)

func _pressed():
	emit_signal("stickerPressed", stickerID)
