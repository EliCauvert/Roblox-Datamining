local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local CryoModule = require(Parent.Cryo)
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local FunnelEventNamesModule = require(MomentsCommon.Analytics.FunnelEventNames)
local _ = require(MomentsCommon.Analytics.Types)
local TelemetryEmitterModule = require(MomentsCommon.Analytics.telemetryEmitter)
local MomentsFunnelStep = SocialLuaAnalyticsModule.Telemetry.new({
	name = "MomentsFunnelStep",
	description = "Moments funnel-step events ported from moments-repo. funnelName/funnelSessionId/stepNumber/stepName plus any customFields are emitted as top-level EventIngest columns so downstream funnel reconstruction continues to work.",
	lastUpdated = { 2026, 5, 28 },
	eventStreamCtx = SocialLuaAnalyticsModule.Analytics.Enums.Contexts.Moments,
	backendsList = {
		{
			type = "EventIngest",
			standardizedFields = { "addSessionInfo", "addSessionId" },
			format = function(p1, _)
				-- upvalues: CryoModule (copy)
				return CryoModule.Dictionary.join(p1.customFields or {}, {
					funnelName = p1.funnelName,
					funnelSessionId = p1.funnelSessionId,
					stepNumber = p1.stepNumber,
					stepName = p1.stepName
				})
			end
		}
	}
})

return function(FunnelName, p1, FunnelSessionId, CustomFields)
	-- upvalues: FunnelEventNamesModule (copy), TelemetryEmitterModule (copy), MomentsFunnelStep (copy)
	local FunnelStep = FunnelEventNamesModule.FunnelSteps[FunnelName]
	
	if not FunnelStep then
		warn(`[Moments] Unknown funnel type: {FunnelName}`)
		
		return
	end
	local FunnelStepEntry = FunnelStep[p1]
	
	if FunnelStepEntry then
		TelemetryEmitterModule.emit(MomentsFunnelStep, {
			funnelName = FunnelName,
			funnelSessionId = FunnelSessionId,
			stepNumber = FunnelStepEntry.stepNumber,
			stepName = FunnelStepEntry.stepName,
			customFields = CustomFields
		})
		
		return
	else
		warn(`[Moments] Unknown funnel step '{p3}' for funnel '{FunnelName}'`)
	end
end