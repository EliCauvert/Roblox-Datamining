local eventIngestService = game:GetService("EventIngestService")
local analytics = require(script.Parent.Parent.dependencies).Analytics
local getPlatformTarget = analytics.getPlatformTarget

return {
	Diag = analytics.Analytics.new(game:GetService("RbxAnalyticsService")).Diag,
	EventStream = {
		setRBXEventStream = function(_, p0, p1, p2)
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SetRBXEventStream(getPlatformTarget(), p0, p1, p2 or {})
		end
	}
}