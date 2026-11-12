local HttpService = game:GetService("HttpService")
local ChatOpenTelemetry = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat).chatOpenTelemetry

return function(EventType, p1, Input)
	-- upvalues: ChatOpenTelemetry (copy), HttpService (copy)
	local ResolveEventIdsResult, ResolveEventIdsResult2 = ChatOpenTelemetry.resolveEventIds(p1.chatOpenId, p1.conversationId, p1.universeId)
	
	return {
		eventType = EventType,
		universeId = p1.universeId,
		placeId = p1.placeId,
		conversationId = p1.conversationId or ResolveEventIdsResult2,
		messageId = p1.messageId,
		turnId = p1.turnId,
		chatOpenId = ResolveEventIdsResult,
		parameters = if Input then HttpService:JSONEncode(Input) else nil
	}
end