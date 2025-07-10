galacticWellfareConvoHandler = conv_handler:new {}

function galacticWellfareConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local greetingScreen = convoTemplate:getScreen("greeting")
	
	-- Clone the screen so we can modify it
	local pScreenClone = greetingScreen:cloneScreen()
	local pClonedConvo = LuaConversationScreen(pScreenClone)
	
	-- Set the player's name using the proper method
	pClonedConvo:setDialogTextTU(CreatureObject(pPlayer):getFirstName())
	
	return pScreenClone
end

function galacticWellfareConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	return pConvScreen
end