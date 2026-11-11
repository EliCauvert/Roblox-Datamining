local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Parent.DataHydration.CreatorAgentChat)
local _ = require(BuildExperience.Chat.chatTypes)

return {
	getTarget = function(p1)
		return (p1.getParam("target"))
	end,
	getSubagentTaskState = function(p1)
		return (p1.getParam("subagentTaskState"))
	end,
	getSubagentTaskGroupName = function(p1)
		return (p1.getParam("subagentTaskGroupName"))
	end
}