john_johnson_convo_template = ConvoTemplate:new {
	initialScreen = "greeting",
	templateType = "Lua",
	luaClassHandler = "johnJohnsonConvoHandler",
	screens = {}
}

greeting = ConvoScreen:new {
	id = "greeting",
	customDialogText = "OoOoooOOooh nice to seeing yousa here!",
	stopConversation = "true",
	options = {}
}
john_johnson_convo_template:addScreen(greeting);

addConversationTemplate("john_johnson_convo_template", john_johnson_convo_template); 