extends Node


const WEBSOCKET_URL = 'ws://localhost:8000'
var socket := WebSocketPeer.new()


func _ready() -> void:
	var err = socket.connect_to_url(WEBSOCKET_URL)
	if err != OK:
		print_debug('connection failed: ', err)
	else:
		print_debug('connecting...')
		await get_tree().create_timer(2).timeout
		socket.send_text(JSON.stringify({
			'channel': '____',
			'message': 'echo',
			'payload': 'Hello from Godot',
		}))


func _process(delta: float) -> void:
	socket.poll()
	var state = socket.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			print("Got data from server: ", socket.get_packet().get_string_from_utf8())
	elif state == WebSocketPeer.STATE_CLOSING:
		pass
	elif state == WebSocketPeer.STATE_CLOSED:
		var code = socket.get_close_code()
		print_debug('WebSocket closed with code: %d. Clean: %s' % [code, code != -1])
		set_process(false)
