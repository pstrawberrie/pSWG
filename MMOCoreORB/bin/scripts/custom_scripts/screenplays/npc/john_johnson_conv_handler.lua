print("[DEBUG] Loaded johnJohnsonConvoHandler")

johnJohnsonConvoHandler = conv_handler:new {}

function johnJohnsonConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	print("[DEBUG] johnJohnsonConvoHandler:getInitialScreen called")
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	return convoTemplate:getScreen("greeting")
end

function johnJohnsonConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	print("[DEBUG] johnJohnsonConvoHandler:runScreenHandlers called")
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	-- local clonedConversation = LuaConversationScreen(pConvScreen) -- Not needed

	return pConvScreen
end 