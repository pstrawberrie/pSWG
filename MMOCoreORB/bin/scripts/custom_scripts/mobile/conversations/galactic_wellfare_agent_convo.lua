galactic_wellfare_agent_convo_template = ConvoTemplate:new {
	initialScreen = "greeting",
	templateType = "Lua",
	luaClassHandler = "galacticWellfareConvoHandler",
	screens = {}
}

greeting = ConvoScreen:new {
	id = "greeting",
	customDialogText = "The Galactic Wellfare Commission recently suffered a devastating terrorist attack. It will take us some time to recover...",
	stopConversation = "true",
	options = {}
}
galactic_wellfare_agent_convo_template:addScreen(greeting);

addConversationTemplate("galactic_wellfare_agent_convo_template", galactic_wellfare_agent_convo_template); 