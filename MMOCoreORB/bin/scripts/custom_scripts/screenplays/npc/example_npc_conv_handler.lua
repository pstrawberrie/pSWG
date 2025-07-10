exampleNpcConvoHandler = conv_handler:new {}

function exampleNpcConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local greetingScreen = convoTemplate:getScreen("greeting")
	return greetingScreen
end

function exampleNpcConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	return pConvScreen
end 