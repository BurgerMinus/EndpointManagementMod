extends "res://Scripts/Hosts/Bosses/Lv2/CityBossAI.gd"

var em2 = false

# because i cant extend the CityBossOrbController, ill store all of the data members i would store there here (thank god godot doesnt believe in information hiding)
enum EM2_State{
	LASER_SWIPE = 7570,
	CROSS_SNIPE = 7580,
	DUAL_BULLET_SPIRAL = 7581,
	ATROPOS = 7590,
	MULTI_SNIPE = 7591
}
var shoot_laser = [false, false, false]
var angles = [0, 0, 0]
const ADV_1 = [CityBossOrbController.State.LASER_SNIPE, CityBossOrbController.State.BULLET_SPREAD, CityBossOrbController.State.BULLET_SWEEP, EM2_State.LASER_SWIPE] 
const ADV_2 = [CityBossOrbController.State.LASER_WALL, CityBossOrbController.State.DOUBLE_LASER_SWING, EM2_State.CROSS_SNIPE, EM2_State.DUAL_BULLET_SPIRAL] 
const ADV_3 = [CityBossOrbController.State.LASER_DISC, CityBossOrbController.State.LASER_CAGE, EM2_State.ATROPOS, EM2_State.MULTI_SNIPE] 

func initialize(boss, starting_conditions = null):
	super(boss, starting_conditions)
	em2 = Upgrades.get_antiupgrade_value('harder_bosses') >= 2
