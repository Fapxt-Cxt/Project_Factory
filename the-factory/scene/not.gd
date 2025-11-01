extends CharacterBody2D

@export var move_speed: float = 100.0
@export var acceleration: float = 800.0
@export var friction: float = 600.0

var is_being_pushed: bool = false
var push_direction: Vector2 = Vector2.ZERO
var pushers: Array[Node2D] = []

func _ready():
	# ✅ ตั้งค่า PushArea สำหรับตรวจว่ามี pusher เข้ามาไหม
	if not has_node("PushArea"):
		var push_area = Area2D.new()
		push_area.name = "PushArea"
		add_child(push_area)

		var collision_shape = CollisionShape2D.new()
		collision_shape.shape = RectangleShape2D.new()
		collision_shape.shape.size = Vector2(70, 70)  # ให้ใหญ่กว่าตัวบล็อกนิด
		push_area.add_child(collision_shape)

		push_area.collision_mask = 1  # layer ที่ตัวละครอยู่

		push_area.body_entered.connect(_on_pusher_entered)
		push_area.body_exited.connect(_on_pusher_exited)

func _physics_process(delta):
	if pushers.size() > 0:
		update_push_direction()

	if is_being_pushed:
		velocity = velocity.move_toward(push_direction * move_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	# ✅ เคลื่อนบล็อก
	var collision = move_and_collide(velocity * delta)
	if collision:
		translate(collision.get_remainder() * 0.9)  # กันการซ้อนหลัก

	# ✅ กันติดผนังหรือตัวละคร
	if is_on_wall():
		position += -push_direction * 0.7

func update_push_direction():
	var total_direction = Vector2.ZERO
	for pusher in pushers:
		if pusher.has_method("get_last_movement_direction"):
			total_direction += pusher.get_last_movement_direction()
		elif pusher is CharacterBody2D and pusher.velocity.length() > 0:
			total_direction += pusher.velocity.normalized()
	if total_direction != Vector2.ZERO:
		push_direction = total_direction.normalized()

func _on_pusher_entered(body: Node2D):
	if body.is_in_group("pusher"):
		pushers.append(body)
		is_being_pushed = true

func _on_pusher_exited(body: Node2D):
	if body in pushers:
		pushers.erase(body)
	if pushers.size() == 0:
		is_being_pushed = false

func stop_push():
	is_being_pushed = false
