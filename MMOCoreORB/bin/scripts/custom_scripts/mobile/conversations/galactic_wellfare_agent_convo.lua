galactic_wellfare_agent_convo_template = ConvoTemplate:new {
	initialScreen = "greeting",
	templateType = "Lua",
	luaClassHandler = "galacticWellfareConvoHandler",
	screens = {}
}

greeting = ConvoScreen:new {
	id = "greeting",
	customDialogText = "Stay safe out there",
	stopConversation = "true",
	options = {}
}
galactic_wellfare_agent_convo_template:addScreen(greeting);

addConversationTemplate("galactic_wellfare_agent_convo_template", galactic_wellfare_agent_convo_template); 