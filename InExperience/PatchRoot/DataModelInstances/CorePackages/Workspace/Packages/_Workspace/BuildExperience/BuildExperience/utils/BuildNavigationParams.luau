local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local _ = require(buildExperience.Chat.chatTypes)

return {
	BUILD_CHAT_SCREEN = "BuildChat",
	getTarget = function(p1)
		return p1.getParam("target")
	end,
	getSubagentTaskState = function(p1)
		return p1.getParam("subagentTaskState")
	end,
	getSubagentTaskGroupName = function(p1)
		return p1.getParam("subagentTaskGroupName")
	end,
	getInitialPrompt = function(p1)
		return p1.getParam("initialPrompt")
	end,
	getShouldDismissOnBack = function(p1)
		return p1.getParam("dismissOnBack") == true
	end
}