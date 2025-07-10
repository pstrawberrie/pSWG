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
	-- planet = "corellia" (planet name: corellia, tatooine, naboo, dantooine, etc.)
	-- template = "john_johnson" (our custom creature template)
	-- respawn = 300 (respawn time in seconds, 0 = no respawn, 300 = 5 minutes)
	-- x, z, y (duh)
	-- direction = 90 (facing direction in degrees: 0=North, 90=East, 180=South, 270=West)
	-- cell = 0 (cell ID: 0 = outside, other numbers = inside buildings/structures)
	--   See examples in: MMOCoreORB/bin/scripts/screenplays/caves/tatooine_tusken_bunker.lua
	-- mood = "conversation" (NPC mood string, see examples in: MMOCoreORB/bin/scripts/screenplays/static_spawns/rori_static_spawns.lua)
	--   Common moods: "conversation", "calm", "nervous", "angry", "sad", "happy", "worried", "neutral"
	--   Special moods: "npc_sitting_ground", "npc_sitting_chair", "npc_use_terminal_high", "fishing", "threaten"
	spawnMobile("corellia", "john_johnson", 300, -137, 28, -4728, 270, 0, "npc_sitting_ground")
end