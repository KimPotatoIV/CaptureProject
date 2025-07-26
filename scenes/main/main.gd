extends Node2D

##################################################
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_capture_screen_with_ui()
	elif Input.is_action_just_pressed("ui_cancel"):
		_capture_screen_without_ui()

##################################################
func _capture_screen_with_ui() -> void:
	get_viewport().get_texture().get_image().save_png("user://with_ui.png")

##################################################
func _capture_screen_without_ui() -> void:
	$HUD.visible = false
	await get_tree().process_frame
	get_viewport().get_texture().get_image().save_png("user://without_ui.png")
	$HUD.visible = true

'''
await get_tree().process_frame: 렌더링 1프레임이 끝날 때까지 기다림

get_viewport():	현재 화면(Viewport)을 가져옴
get_texture():	그 화면의 렌더링 결과(텍스처)를 가져옴
get_image():		GPU 텍스처를 CPU로 복사해서 이미지로 만듦
'''
