local EventIngestService = game:GetService("EventIngestService")
local AnalyticsModule = require(script.Parent.Parent.Parent.Analytics)
local GetPlatformTargetFunction = AnalyticsModule.getPlatformTarget

return {
	Diag = AnalyticsModule.Analytics.new((game:GetService("RbxAnalyticsService"))).Diag,
	EventStream = {
		setRBXEventStream = function(_, EventContext, EventName, p1)
			-- upvalues: EventIngestService (copy), GetPlatformTargetFunction (copy)
			EventIngestService:SetRBXEventStream(GetPlatformTargetFunction(), EventContext, EventName, p1 or {})
		end,
		sendEventDeferred = function(_, EventContext, EventName, p1)
			-- upvalues: EventIngestService (copy), GetPlatformTargetFunction (copy)
			EventIngestService:SendEventDeferred(GetPlatformTargetFunction(), EventContext, EventName, p1 or {})
		end
	}
}