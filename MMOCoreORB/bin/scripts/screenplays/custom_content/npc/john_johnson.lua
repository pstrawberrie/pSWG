JohnJohnsonScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "JohnJohnsonScreenPlay"
}

-- Register the screenplay to be loaded at server startup
registerScreenPlay("JohnJohnsonScreenPlay", true)

-- This function gets called automatically when the screenplay starts
function JohnJohnsonScreenPlay:start()
	self:spawnMobiles()
end

-- Spawn our NPC
function JohnJohnsonScreenPlay:spawnMobiles()
	-- Spawn John Johnson at the specified coordinates
	-- Format: spawnMobile(planet, template, respawn, x, z, y, direction, cell, mood)
	-- planet = "corellia", template = "commoner", respawn = 300 (5 minutes), 
	-- x = -390, z = 28, y = -4639, direction = 0 (facing north), cell = 0 (outside), mood = "conversation"
	spawnMobile("corellia", "commoner", 300, -390, 28, -4639, 0, 0, "conversation")
end