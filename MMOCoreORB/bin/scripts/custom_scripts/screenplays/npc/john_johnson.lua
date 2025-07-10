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
	-- Using our custom creature template "john_johnson" instead of "gungan_hermit"
	-- This makes him non-attackable and gives us full control over his properties
	-- Format: spawnMobile(planet, template, respawn, x, z, y, direction, cell, mood)
	-- planet = "corellia", template = "john_johnson", respawn = 300 (5 minutes), 
	-- x = -390, z = 28, y = -4639, direction = 0 (facing north), cell = 0 (outside), mood = "conversation"
	spawnMobile("corellia", "john_johnson", 300, -139, 28, -4729, 0, 0, "conversation")
end