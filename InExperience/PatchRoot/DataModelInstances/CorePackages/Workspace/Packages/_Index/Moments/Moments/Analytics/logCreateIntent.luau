local momentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)
local analytics = momentsCommonModule.Analytics
local funnelEventNames = analytics.FunnelEventNames
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry

return function(p1)
	-- upvalues: analytics (ref), funnelEventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref)
	local var1 = analytics.SessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow)
	analytics.fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.CreationFlow, funnelEventNames.CreationFlowSteps.CreateIntent, var1, { source = p1 })
	analytics.fireAnalyticsEvent(analytics.EventNames.MomentCreationStarted, { source = p1, creationSessionId = var1 })
	
	if fFlagMomentsRealtimeSessionTelemetry then
		analytics.reportMomentsCreationStep("create_intent")
	end
end