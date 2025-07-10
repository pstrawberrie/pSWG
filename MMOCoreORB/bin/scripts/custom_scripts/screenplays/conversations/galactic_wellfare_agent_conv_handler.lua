galacticWellfareConvoHandler = conv_handler:new {}

function galacticWellfareConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local greetingScreen = convoTemplate:getScreen("greeting")
	return greetingScreen
end

function galacticWellfareConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	
	local pScreenClone = screen:cloneScreen()
	local pClonedConvo = LuaConversationScreen(pScreenClone)
	
	-- Set the player's name using the proper method
	pClonedConvo:setDialogTextTU(CreatureObject(pPlayer):getFirstName())
	
	return pScreenClone
end