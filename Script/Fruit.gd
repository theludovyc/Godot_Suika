class_name Fruit
extends RigidBody2D

@export var fruit_type: TheGame.fruit_types

var got_contact = false

signal fruit_contact(type, pos, lin_vel, ang_vel)

func _on_body_entered(body):
	if body is Fruit:
		if body.fruit_type == fruit_type:
			got_contact = true
			if !body.got_contact:
				var middle = (body.position + position) / 2.0
				fruit_contact.emit(fruit_type, middle, linear_velocity, angular_velocity)
				body.queue_free()
				queue_free()
