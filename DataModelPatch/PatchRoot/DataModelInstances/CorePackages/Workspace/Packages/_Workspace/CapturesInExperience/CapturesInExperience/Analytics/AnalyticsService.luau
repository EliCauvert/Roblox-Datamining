local Parent = script.Parent.Parent.Parent
local EventIngestService = game:GetService("EventIngestService")
local AnalyticsModule = require(Parent.Analytics)
local GetPlatformTargetFunction = AnalyticsModule.getPlatformTarget

return {
	Diag = AnalyticsModule.Analytics.new((game:GetService("RbxAnalyticsService"))).Diag,
	EventStream = {
		setRBXEventStream = function(_, EventContext, EventName, p1)
			-- upvalues: EventIngestService (copy), GetPlatformTargetFunction (copy)
			EventIngestService:SetRBXEventStream(GetPlatformTargetFunction(), EventContext, EventName, p1 or {})
		end
	},
	Telemetry = require(Parent.LoggingProtocol).default
}