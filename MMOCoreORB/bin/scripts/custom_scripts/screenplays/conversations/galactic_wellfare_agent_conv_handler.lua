galacticWellfareConvoHandler = conv_handler:new {}

function galacticWellfareConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local greetingScreen = convoTemplate:getScreen("greeting")
	
	-- Get the player's first name
	local playerName = CreatureObject(pPlayer):getFirstName()
	
	-- Replace the placeholder with the actual player name
	local dialogText = greetingScreen:getDialogText()
	dialogText = string.gsub(dialogText, "%%TT_NAME%%", playerName)
	greetingScreen:setDialogText(dialogText)
	
	return greetingScreen
end

function galacticWellfareConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	return pConvScreen
end