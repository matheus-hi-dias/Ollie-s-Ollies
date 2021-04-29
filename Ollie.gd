extends Area2D

var chao = Vector2(120,430)
var gravidade = 4000
var velocidade = Vector2()
var velocidade_pulo = -1280
var modificador_gravidade = 2.1

var tempo  = 0.0
var intervalo_ini = 3
var intervalo_min = 0.5
var intervalo_max = 3

var obstaculos = [preload("res://Hidrante.tscn"),
				  preload("res://HidranteP.tscn"),
				  preload("res://Pneus.tscn"),
				  preload("res://Fonte_obstaculo.tscn"),
				  preload("res://PneusG.tscn")]

func _ready():
	set_position(chao)
	randomize()
	pass

func _physics_process(delta):
	tempo += delta
	
	if tempo >= intervalo_ini:
		tempo = 0
		
		#Decide obstáculo
		var o = rand_range(0, obstaculos.size())
		get_parent().add_child(obstaculos[o].instance())
		
		#Decipe tempo dos obstáculos
		var intervalo = rand_range(intervalo_min, intervalo_max)
	
	if Input.is_action_pressed("pular"):
		velocidade.y += gravidade * delta
	else:
		velocidade.y += gravidade * delta * modificador_gravidade
	
	if Input.is_action_just_pressed("pular") and position == chao:
		velocidade.y = velocidade_pulo
	
	position += velocidade * delta
	
	
	if get_position().y > chao.y :
		set_position(chao)
		velocidade = Vector2()
		
func colidiu(area):
	queue_free()
