local parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(parent.DataHydration.CreatorAgentChat)
local _ = require(parent.Signals)

return {
	PENDING_USER_MESSAGE_ID_SUFFIX = ":pending",
	getResourceAttachmentUri = function(p1)
		return if p1.type == "resource_link" then p1.uri else p1.resource.uri
	end,
	makeAssistantTurnAnchorKey = function(p1, p2)
		return if p2 == nil then nil else `turn:{p1 or "project"}:sequence:{p2}`
	end
}