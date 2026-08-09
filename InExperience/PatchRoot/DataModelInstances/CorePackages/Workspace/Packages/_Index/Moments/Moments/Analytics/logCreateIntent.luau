local analytics = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Analytics
local funnelEventNames = analytics.FunnelEventNames

return function(p0) --[[ line: 26 | named "logCreateIntent" ]]
	-- upvalues: analytics (ref), funnelEventNames (ref)
	analytics.fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.CreationFlow, funnelEventNames.CreationFlowSteps.CreateIntent, analytics.SessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow), { source = p0 })
	analytics.fireAnalyticsEvent(analytics.EventNames.MomentCreationStarted, { source = p0 })
end