local eventIngestService = game:GetService("EventIngestService")
local analyticsModule = require(script.Parent.Parent.Parent.Analytics)
local getPlatformTarget = analyticsModule.getPlatformTarget

return {
	Diag = analyticsModule.Analytics.new(game:GetService("RbxAnalyticsService")).Diag,
	EventStream = {
		setRBXEventStream = function(_, p0, p1, p2) --[[ line: 14 ]]
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SetRBXEventStream(getPlatformTarget(), p0, p1, p2 or {})
		end,
		sendEventDeferred = function(_, p3, p4, p5) --[[ line: 19 ]]
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SendEventDeferred(getPlatformTarget(), p3, p4, p5 or {})
		end
	}
}