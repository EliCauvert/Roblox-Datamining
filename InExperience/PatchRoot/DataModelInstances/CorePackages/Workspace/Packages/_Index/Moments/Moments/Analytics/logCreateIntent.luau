local momentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)
local analytics = momentsCommonModule.Analytics
local funnelEventNames = analytics.FunnelEventNames
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry

return function(p1)
	-- upvalues: analytics (ref), funnelEventNames (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), fFlagMomentsRealtimeSessionTelemetry (ref)
	local var1 = analytics.SessionManager.startSession(funnelEventNames.FunnelTypes.CreationFlow)
	analytics.fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.CreationFlow, funnelEventNames.CreationFlowSteps.CreateIntent, var1, { source = p1 })
	local t = { source = p1 }
	
	if getFFlagMomentsAnalyticsProducerPrereqs() then
		t.creationSessionId = var1
	end
	analytics.fireAnalyticsEvent(analytics.EventNames.MomentCreationStarted, t)
	
	if fFlagMomentsRealtimeSessionTelemetry then
		analytics.reportMomentsCreationStep("create_intent")
	end
end