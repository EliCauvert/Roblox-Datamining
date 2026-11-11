local Analytics = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Analytics
local FunnelEventNames = Analytics.FunnelEventNames

return function(Source)
	-- upvalues: Analytics (copy), FunnelEventNames (copy)
	Analytics.fireFunnelAnalyticsEvent(FunnelEventNames.FunnelTypes.CreationFlow, FunnelEventNames.CreationFlowSteps.CreateIntent, Analytics.SessionManager.startSession(FunnelEventNames.FunnelTypes.CreationFlow), { source = Source })
	Analytics.fireAnalyticsEvent(Analytics.EventNames.MomentCreationStarted, { source = Source })
end