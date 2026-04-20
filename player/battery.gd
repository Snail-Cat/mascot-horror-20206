class_name Battery
extends Node


@export var battery_bar1: ProgressBar 
@export var battery_bar2: ProgressBar  
@export var battery_bar3: ProgressBar  
@export var point_light: PointLight2D

var current_level_duration := 100.0
var current_level := 2
var tween: Tween


func _process(delta: float) -> void:
	#check de qual bateria está funcionando / timer da bateria
	if current_level == 2:
		current_level_duration -= delta * 30 # valores modificáveis pra velocidades diferentes
		battery_bar1.value = current_level_duration # implementa o timer da bateria no node da barraa
	elif current_level == 1: 
		current_level_duration -= delta * 20
		battery_bar2.value = current_level_duration
	else:
		current_level_duration -= delta
		battery_bar3.value = current_level_duration
		
	# possível método de adicionar bateria (precisaria adicionar variável bateria máxima e 
	# fazer alguns reajustes)
	# if _battery_get()  
		# current_level_duration += battery_value
	
	_set_current_level()


func _set_current_level():
	#check se o timer chegou ao final
	if current_level_duration < 0:
		current_level -= 1 #diminui o nivel
		
		#if current_level < 0	# checa se a luz acabou
			#death function (a ser criada)
		
		current_level_duration = 100.0 #reinicia o timer 
	
	#if current_level_duration > 100:
		
	
	if current_level == 2:
		if tween:
			tween.kill() #check pra garantir que não tem tweens ativos
	
		tween = get_tree().create_tween() # criando tree do tween
		tween.tween_property(point_light, "texture_scale", 1.0, 1.0)  # tween da luz nivel 2

	if current_level == 1:
		if tween:
			tween.kill() #check pra garantir que não tem tweens ativos
	
		tween = get_tree().create_tween() # criando tree do tween
		tween.tween_property(point_light, "texture_scale", 0.75, 1.0)  # tween da luz nivel 1

	if current_level == 0:
		if tween:
			tween.kill() #check pra garantir que não tem tweens ativos
	
		tween = get_tree().create_tween() # criando tree do tween
		tween.tween_property(point_light, "texture_scale", 0.5, 1.0)  # tween da luz nivel 0
		
