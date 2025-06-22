@tool
extends EditorPlugin

const Main = preload("res://addons/jugo_man/src/main.tscn")

var main : Node


func _enter_tree() -> void:
	main = Main.instantiate()
	EditorInterface.get_editor_main_screen().add_child(main)
	add_tool_menu_item("Run My Script", _on_run_my_script)


func _exit_tree() -> void:
	if main: main.queue_free()
	remove_tool_menu_item("Run My Script")


func _on_run_my_script():
	print("スクリプトが実行されました！")
