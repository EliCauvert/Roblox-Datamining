local EventIngestService = game:GetService("EventIngestService")
local AnalyticsModule = require(script:FindFirstAncestor("EditProfile").Parent.Analytics)
local GetPlatformTargetFunction = AnalyticsModule.getPlatformTarget

return {
	Diag = AnalyticsModule.Analytics.new((game:GetService("RbxAnalyticsService"))).Diag,
	EventStream = {
		setRBXEventStream = function(_, EventContext, EventName, p1) --[[ Line: 13 ]]
			-- upvalues: EventIngestService (copy), GetPlatformTargetFunction (copy)
			EventIngestService:SetRBXEventStream(GetPlatformTargetFunction(), EventContext, EventName, p1 or {})
		end
	}
}