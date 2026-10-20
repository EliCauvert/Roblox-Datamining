local MomentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)
local Analytics = MomentsCommonModule.Analytics
local FunnelEventNames = Analytics.FunnelEventNames
local FFlagMomentsRealtimeSessionTelemetry = MomentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry

return function(Source)
	-- upvalues: Analytics (copy), FunnelEventNames (copy), FFlagMomentsRealtimeSessionTelemetry (copy)
	local StartSessionResult = Analytics.SessionManager.startSession(FunnelEventNames.FunnelTypes.CreationFlow)
	Analytics.fireFunnelAnalyticsEvent(FunnelEventNames.FunnelTypes.CreationFlow, FunnelEventNames.CreationFlowSteps.CreateIntent, StartSessionResult, { source = Source })
	Analytics.fireAnalyticsEvent(Analytics.EventNames.MomentCreationStarted, { source = Source, creationSessionId = StartSessionResult })
	
	if FFlagMomentsRealtimeSessionTelemetry then
		Analytics.reportMomentsCreationStep("create_intent")
	end
end