local eventIngestService = game:GetService("EventIngestService")
local analyticsModule = require(script:FindFirstAncestor("EditProfile").Parent.Analytics)
local getPlatformTarget = analyticsModule.getPlatformTarget

return {
	Diag = analyticsModule.Analytics.new(game:GetService("RbxAnalyticsService")).Diag,
	EventStream = {
		setRBXEventStream = function(_, p0, p1, p2) --[[ line: 13 ]]
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SetRBXEventStream(getPlatformTarget(), p0, p1, p2 or {})
		end
	}
}