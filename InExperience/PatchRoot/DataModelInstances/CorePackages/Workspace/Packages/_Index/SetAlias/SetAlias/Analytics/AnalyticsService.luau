local EventIngestService = game:GetService("EventIngestService")
local Analytics = require(script.Parent.Parent.dependencies).Analytics
local GetPlatformTargetFunction = Analytics.getPlatformTarget

return {
	Diag = Analytics.Analytics.new((game:GetService("RbxAnalyticsService"))).Diag,
	EventStream = {
		setRBXEventStream = function(_, EventContext, EventName, p1) --[[ Line: 13 ]]
			-- upvalues: EventIngestService (copy), GetPlatformTargetFunction (copy)
			EventIngestService:SetRBXEventStream(GetPlatformTargetFunction(), EventContext, EventName, p1 or {})
		end
	}
}