johnJohnsonConvoHandler = conv_handler:new {}

function johnJohnsonConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	print("[DEBUG] johnJohnsonConvoHandler:getInitialScreen called")
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local greetingScreen = convoTemplate:getScreen("greeting")
	if greetingScreen == nil then
		print("[DEBUG] getScreen('greeting') returned nil!")
	else
		print("[DEBUG] getScreen('greeting') returned a valid screen.")
	end
	return greetingScreen
end

function johnJohnsonConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	print("[DEBUG] johnJohnsonConvoHandler:runScreenHandlers called")
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	print("[DEBUG] runScreenHandlers screenID:", screenID)
	local pConvScreen = screen:cloneScreen()
	-- local clonedConversation = LuaConversationScreen(pConvScreen) -- Not needed

	return pConvScreen
end 