local parent = script.Parent.Parent.Parent
local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local analyticsModule = require(parent.Analytics)
local getPlatformTarget = analyticsModule.getPlatformTarget

return {
	Diag = analyticsModule.Analytics.new(rbxAnalyticsService).Diag,
	EventStream = {
		setRBXEventStream = function(_, p1, p2, p3)
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SetRBXEventStream(getPlatformTarget(), p1, p2, p3 or {})
		end
	},
	Telemetry = require(parent.LoggingProtocol).default
}