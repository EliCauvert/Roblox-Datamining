local parent = script.Parent.Parent.Parent
local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local analyticsModule = require(parent.Analytics)
local getPlatformTarget = analyticsModule.getPlatformTarget

return {
	Diag = analyticsModule.Analytics.new(rbxAnalyticsService).Diag,
	EventStream = {
		setRBXEventStream = function(_, p0, p1, p2)
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SetRBXEventStream(getPlatformTarget(), p0, p1, p2 or {})
		end
	},
	Telemetry = require(parent.LoggingProtocol).default
}