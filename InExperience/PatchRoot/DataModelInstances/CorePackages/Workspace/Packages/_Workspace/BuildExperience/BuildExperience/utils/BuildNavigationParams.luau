local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local _ = require(buildExperience.Chat.chatTypes)

return {
	getTarget = function(p0)
		return p0.getParam("target")
	end,
	getSubagentTaskState = function(p1)
		return p1.getParam("subagentTaskState")
	end,
	getSubagentTaskGroupName = function(p2)
		return p2.getParam("subagentTaskGroupName")
	end
}