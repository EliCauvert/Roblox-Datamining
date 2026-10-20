local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.DataHydration.CreatorAgentChat)
local _ = require(Parent.Signals)

return {
	PENDING_USER_MESSAGE_ID_SUFFIX = ":pending",
	getResourceAttachmentUri = function(p1)
		return if p1.type == "resource_link" then p1.uri else p1.resource.uri
	end,
	makeAssistantTurnAnchorKey = function(p1, p2)
		local P1 = p1 or "project"
		
		return if p2 == nil then nil else `turn:{P1}:sequence:{p2}`
	end
}