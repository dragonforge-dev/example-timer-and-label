extends Label

const EXPLOSION = preload("uid://c0tfnlbfj8c65")

func _ready():
	Global.timer.start()
	Global.timer.timeout.connect(_on_timer_timeout)


func _time_left_until_expired_food_explodes() -> String:
	var time_left: float = Global.timer.time_left
	var minute: float = floor(time_left / 60)
	var second: float = int(time_left) % 60
	return "Time remaining: %02d:%02d" % [minute, second]


func _process(_delta):
	text = _time_left_until_expired_food_explodes()


func _on_timer_timeout():
	get_tree().change_scene_to_packed(EXPLOSION)
