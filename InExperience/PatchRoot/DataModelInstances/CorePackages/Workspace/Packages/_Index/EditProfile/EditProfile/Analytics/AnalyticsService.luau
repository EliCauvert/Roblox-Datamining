local eventIngestService = game:GetService("EventIngestService")
local analyticsModule = require(script:FindFirstAncestor("EditProfile").Parent.Analytics)
local getPlatformTarget = analyticsModule.getPlatformTarget

return {
	Diag = analyticsModule.Analytics.new(game:GetService("RbxAnalyticsService")).Diag,
	EventStream = {
		setRBXEventStream = function(_, p1, p2, p3)
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SetRBXEventStream(getPlatformTarget(), p1, p2, p3 or {})
		end
	}
}