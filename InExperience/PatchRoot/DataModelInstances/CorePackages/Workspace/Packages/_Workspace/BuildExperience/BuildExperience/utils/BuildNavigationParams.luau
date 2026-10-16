local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Parent.DataHydration.CreatorAgentChat)
local _ = require(BuildExperience.Chat.chatTypes)

return {
	BUILD_CHAT_SCREEN = "BuildChat",
	getTarget = function(p1) --[[ Line: 20 ]]
		return (p1.getParam("target"))
	end,
	getSubagentTaskState = function(p1) --[[ Line: 24 ]]
		return (p1.getParam("subagentTaskState"))
	end,
	getSubagentTaskGroupName = function(p1) --[[ Line: 28 ]]
		return (p1.getParam("subagentTaskGroupName"))
	end,
	getInitialPrompt = function(p1) --[[ Line: 34 ]]
		return (p1.getParam("initialPrompt"))
	end,
	getShouldDismissOnBack = function(p1): boolean --[[ Line: 41 ]]
		return p1.getParam("dismissOnBack") == true
	end
}