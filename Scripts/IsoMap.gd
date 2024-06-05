extends TileMap

@export var chunk_size: int = 9

var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_child(0)
	draw_chunk(make_chunk)
	
	var chunk_index = Vector2(chunk_size/2, chunk_size/2)
	player.position = map_to_local(chunk_index)
	set_cell(0, Vector2i(0, 0), 1, Vector2(2, 8), 0) #layer, loc coord, source, atlas coord, alternative tile


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func draw_chunk(chunk_func: Callable):
	var chunk = chunk_func.call()
	
	for x in range(len(chunk)):
		for y in range (len(chunk[x])):
			set_cell(0, Vector2i(x, y), 1, Vector2(2, 8), 0)
			
func make_chunk() -> Array:
	var chunk: Array = Array()
	for x in range(chunk_size):
		chunk.push_back(Array())
		for y in range (chunk_size):
			chunk[x].push_back(0)
	return chunk
