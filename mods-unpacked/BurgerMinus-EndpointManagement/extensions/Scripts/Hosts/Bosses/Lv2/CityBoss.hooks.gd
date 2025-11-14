extends Object

# increase health and shield coverage
func _ready(chain: ModLoaderHookChain):
	
	var heap := chain.reference_object as HEAP_BOSS
	
	chain.execute_next()
	
	if heap.AI.em2:
		heap.max_health = 5000
		heap.init_healthbar()
		heap.set_shield_width(120)

# handle invincibilty
func _physics_process(chain: ModLoaderHookChain, delta):
	
	var heap := chain.reference_object as HEAP_BOSS
	
	chain.execute_next([delta])
	
	if heap.AI.em2:
		heap.invincible = heap.active_shields != 0

# prevent shield from being lowered until all orbs are detached
func set_active_shield_count(chain: ModLoaderHookChain, count):
	
	var heap := chain.reference_object as HEAP_BOSS
	
	chain.execute_next([count])
	
	if heap.AI.em2 and heap.active_shields != 0:
		for i in range(3):
			heap.shield_visuals[i].visible = true

# handle shield
func is_within_active_shield_angle(chain: ModLoaderHookChain, point):
	
	var heap := chain.reference_object as HEAP_BOSS
	
	if heap.AI.em2:
		return heap.active_shields != 0
	else:
		return chain.execute_next([point])
