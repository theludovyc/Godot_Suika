extends Node

var fruits = [
	preload("res://Scene/strawberry.tscn"),
	preload("res://Scene/blackberry.tscn"),
	preload("res://Scene/peach.tscn"),
	preload("res://Scene/lime.tscn"),
	preload("res://Scene/banana.tscn")
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func instantiate_fruit(index:int, position:Vector2, lin_vel = Vector2.ZERO, ang_vel = 0):
	var fruit = fruits[index].instantiate()
	fruit.position = position
	fruit.linear_velocity = lin_vel
	fruit.angular_velocity = ang_vel
	fruit.fruit_contact.connect(on_fruit_contact)
	call_deferred("add_child", fruit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("left_click"):
		instantiate_fruit(randi() % 3, Vector2(get_viewport().get_mouse_position().x, 800))
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	pass

func on_fruit_contact(type, pos, lin_vel, ang_vel):
	if type > fruits.size() - 2:
		return
	
	instantiate_fruit(type + 1, pos, lin_vel, ang_vel)
	
	pass
