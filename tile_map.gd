extends TileMap

var moisture = FastNoiseLite.new() # Độ ẩm
var temperature = FastNoiseLite.new() # Nhiệt độ
var altitude = FastNoiseLite.new() # Độ cao

var width = 1280
var height = 1280

func _ready() -> void:
	var rand = randi()
	moisture.seed = rand
	temperature.seed = rand
	# Setting cho độ cao map
	altitude.frequency = 0.005 # mức độ nhiễu
	altitude.seed = rand
	# generate map
	generate_chunk()




func generate_chunk():
	#range(-width/2, width/2) vì x y sẽ bắt đầu từ 0 nếu lặp trong range width, nên lặp từ -width/2 tới width/2 thì map sẽ center
	for x in range(-width/2, width/2):
		for y in range(-height/2, height/2):
			#var moist = moisture.get_noise_2d(x, y)
			#var temp = temperature.get_noise_2d(x, y)
			#Generate height map
			var alt = altitude.get_noise_2d(x, y)
			if(alt>0.7):
				#set_cell => layer(layer của tile), position(vị trí cần set), id của tile set, vị trí trong tileset, alternative
				set_cell(0,Vector2(x, y), 0, Vector2i(0, 0), 0)
			elif(alt>0.6):
				set_cell(0,Vector2(x, y), 0, Vector2i(0, 3), 0)
			elif(alt>0.4):
				set_cell(0,Vector2(x, y), 0, Vector2i(1, 1), 0)
			elif(alt>0.0):
				set_cell(0,Vector2(x, y), 0, Vector2i(1, 2), 0)
			elif(alt>-0.1):
				set_cell(0,Vector2(x, y), 0, Vector2i(0, 2), 0)
			elif(alt > -0.3):  
				set_cell(0,Vector2(x, y), 0, Vector2i(3, 1), 0)
			else:
				set_cell(0,Vector2(x, y), 0, Vector2i(3, 0), 0)	
