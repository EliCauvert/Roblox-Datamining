local analytics = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsCommon).Analytics
local funnelEventNames = analytics.FunnelEventNames

return function(p1)
	-- upvalues: analytics (ref), funnelEventNames (ref)
	local var1 = analytics.SessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow)
	analytics.fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.CreationFlow, funnelEventNames.CreationFlowSteps.CreateIntent, var1, { source = p1 })
	analytics.fireAnalyticsEvent(analytics.EventNames.MomentCreationStarted, { source = p1, creationSessionId = var1 })
end