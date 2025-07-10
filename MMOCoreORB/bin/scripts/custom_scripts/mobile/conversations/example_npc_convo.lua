example_npc_convo_template = ConvoTemplate:new {
	initialScreen = "greeting",
	templateType = "Lua",
	luaClassHandler = "exampleNpcConvoHandler",
	screens = {}
}

greeting = ConvoScreen:new {
	id = "greeting",
	customDialogText = "Hello there! I'm an example NPC. Nice to meet you!",
	stopConversation = "true",
	options = {}
}
example_npc_convo_template:addScreen(greeting);

addConversationTemplate("example_npc_convo_template", example_npc_convo_template); 