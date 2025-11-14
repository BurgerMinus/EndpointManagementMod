extends Node


const EM_DIR := "BurgerMinus-EndpointManagement"
const EM_LOG_NAME := "BurgerMinus-EndpointManagement:Main"

var mod_dir_path := ""
var script_hooks_path := ""

func _init() -> void:
	
	Upgrades.antiupgrades['harder_bosses'] = {
		'name' : "Endpoint Management",
		'desc' : "Greatly increases the difficulty of +1 boss per stack",
		'increase_per_rank' : 1,
		'decreasing' : false,
		'value_per_rank': [2.0, 3.0, 4.0], 
		'max_rank' : 2,
		'percentage' : false,
		'progression_flag' : 'antiupgrade_harder_bosses',
		'daily_run_compatible' : false
	}
	
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(EM_DIR)
	script_hooks_path = mod_dir_path.path_join("extensions/Scripts")
	
	ModLoaderMod.install_script_hooks("res://Scripts/Save/GlobalProgression.gd", mod_dir_path.path_join("extensions/Scripts/Save/GlobalProgression.hooks.gd"))
	
	install_em1()
	
	install_em2()
	

func install_em1():
	
	ModLoaderMod.install_script_hooks("res://Scripts/Hosts/Bosses/MountainBoss.gd", mod_dir_path.path_join("extensions/Scripts/Hosts/Bosses/MountainBoss.hooks.gd"))
	ModLoaderMod.install_script_extension(mod_dir_path.path_join("extensions/Scripts/Hosts/Bosses/MountainBossAI.gd"))

func install_em2():
	
	ModLoaderMod.install_script_hooks("res://Scripts/Hosts/Bosses/Lv2/CityBoss.gd", mod_dir_path.path_join("extensions/Scripts/Hosts/Bosses/Lv2/CityBoss.hooks.gd"))
	ModLoaderMod.install_script_extension(mod_dir_path.path_join("extensions/Scripts/Hosts/Bosses/Lv2/CityBossAI.gd"))
	
	ModLoaderMod.install_script_hooks("res://Scripts/Hosts/Bosses/Lv2/CityBossOrb.gd", mod_dir_path.path_join("extensions/Scripts/Hosts/Bosses/Lv2/CityBossOrb.hooks.gd"))
	ModLoaderMod.install_script_extension(mod_dir_path.path_join("extensions/Scripts/Hosts/Bosses/Lv2/CityBossOrbAI.gd"))
	
	ModLoaderMod.install_script_hooks("res://Scripts/Hosts/Bosses/Lv2/CityBossOrbController.gd", mod_dir_path.path_join("extensions/Scripts/Hosts/Bosses/Lv2/CityBossOrbController.hooks.gd"))

func _ready() -> void:
	ModLoaderLog.info("Ready!", EM_LOG_NAME)
