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
	-- Format: spawnMobile(planet, template, respawn, x, z, y, direction, cell, mood)
	-- planet = "corellia", template = "john_johnson", respawn = 300 (5 minutes), x z y (self-explanatory)
	-- direction = 3 (facing east - north is 0), cell = 0 (outside), mood = "conversation"
	spawnMobile("corellia", "john_johnson", 300, -136, 28, -4728, 3, 0, "conversation")
end