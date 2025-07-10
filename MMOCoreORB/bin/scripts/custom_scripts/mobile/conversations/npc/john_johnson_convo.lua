john_johnson_convo_template = ConvoTemplate:new {
	initialScreen = "greeting",
	templateType = "Lua",
	luaClassHandler = "johnJohnsonConvoHandler",
	screens = {}
}

greeting = ConvoScreen:new {
	id = "greeting",
	leftDialog = "@conversation/greeter_coronet_merchant:s_b78b7ed6",
	stopConversation = "true",
	options = {}
}
john_johnson_convo_template:addScreen(greeting);

addConversationTemplate("john_johnson_convo_template", john_johnson_convo_template); 