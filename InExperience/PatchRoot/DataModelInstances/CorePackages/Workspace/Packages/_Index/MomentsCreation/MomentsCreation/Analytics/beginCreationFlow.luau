local Analytics = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsCommon).Analytics
local FunnelEventNames = Analytics.FunnelEventNames

return function(Source) --[[ Line: 10 | Named "beginCreationFlow" ]]
	-- upvalues: Analytics (copy), FunnelEventNames (copy)
	local StartSessionResult = Analytics.SessionManager.startSession(FunnelEventNames.FunnelTypes.CreationFlow)
	Analytics.fireFunnelAnalyticsEvent(FunnelEventNames.FunnelTypes.CreationFlow, FunnelEventNames.CreationFlowSteps.CreateIntent, StartSessionResult, { source = Source })
	Analytics.fireAnalyticsEvent(Analytics.EventNames.MomentCreationStarted, { source = Source, creationSessionId = StartSessionResult })
end