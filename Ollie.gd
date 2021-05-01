extends Area2D

signal recomecou

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
	$AnimatedSprite.play("parado")
	pass

func _physics_process(delta):
	if not get_parent().comecou:
		return
	
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
		$AnimatedSprite.play("pulo")
	else:
		velocidade.y += gravidade * delta * modificador_gravidade
	
	if Input.is_action_just_pressed("pular") and position == chao:
		velocidade.y = velocidade_pulo
		$AnimatedSprite.play("pulo")
	
	position += velocidade * delta
	
	
	if get_position().y > chao.y :
		set_position(chao)
		velocidade = Vector2()
		
func colidiu(area):
	$AnimatedSprite.play("morte")
	get_parent().comecou = false
	get_parent().acabou = true
	
	if get_parent().pontos > get_parent().record:
		get_parent().record = get_parent().pontos
	pass
	
func _input(event):
	if event is InputEventKey or event is InputEventMouseButton:
		if get_parent().acabou and not event.is_echo():
			emit_signal("recomecou")
			get_parent().acabou = false
			get_parent().get_node("Record").text = "Record: " + str(get_parent().record)
			pass
			
		get_parent().comecou = true
		$AnimatedSprite.play("andando")
