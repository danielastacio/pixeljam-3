extends Node

var typeofDocument: DocumentArea.Document

@export var workerSprite: Sprite2D
@export var workerText: Label
# Called when the node enters the scene tree for the first time.
func _ready():
	var randomNum = randf_range(0, DocumentArea.Document.size())
	typeofDocument = randomNum
	
	workerText.text += "" + DocumentArea.Document.keys()[typeofDocument]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_area_entered(area):
	if area is DocumentArea and area.typeofDocument == typeofDocument:
		var doc = area as DocumentArea
		doc.documentNode.visible = false
		
		self.queue_free()
		print("Right")
	else:
		workerSprite.modulate = Color.RED
		workerText.text = "NO! I SAID a " + DocumentArea.Document.keys()[typeofDocument]
		print("Wrong")