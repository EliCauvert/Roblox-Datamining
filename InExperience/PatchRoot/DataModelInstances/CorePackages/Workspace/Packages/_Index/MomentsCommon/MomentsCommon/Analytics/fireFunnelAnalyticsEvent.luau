local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local cryoModule = require(parent.Cryo)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local funnelEventNamesModule = require(momentsCommon.Analytics.FunnelEventNames)
local _ = require(momentsCommon.Analytics.Types)
local telemetryEmitterModule = require(momentsCommon.Analytics.telemetryEmitter)
local var1 = socialLuaAnalyticsModule.Telemetry.new({
	name = "MomentsFunnelStep",
	description = "Moments funnel-step events ported from moments-repo. funnelName/funnelSessionId/stepNumber/stepName plus any customFields are emitted as top-level EventIngest columns so downstream funnel reconstruction continues to work.",
	lastUpdated = { 2026, 5, 28 },
	eventStreamCtx = socialLuaAnalyticsModule.Analytics.Enums.Contexts.Moments,
	backendsList = {
		{
			type = "EventIngest",
			standardizedFields = if require(momentsCommon.Flags.GetFFlagMomentsAnalyticsProducerPrereqs)() then { "addSessionInfo", "addSessionId" } else nil,
			format = function(p1, _)
				-- upvalues: cryoModule (ref)
				return cryoModule.Dictionary.join(p1.customFields or {}, {
					funnelName = p1.funnelName,
					funnelSessionId = p1.funnelSessionId,
					stepNumber = p1.stepNumber,
					stepName = p1.stepName
				})
			end
		}
	}
})

return function(p1, p2, p3, p4)
	-- upvalues: funnelEventNamesModule (ref), telemetryEmitterModule (ref), var1 (ref)
	local var2 = funnelEventNamesModule.FunnelSteps[p1]
	
	if not var2 then
		warn(`[Moments] Unknown funnel type: {p1}`)
		
		return
	end
	local var3 = var2[p2]
	
	if var3 then
		telemetryEmitterModule.emit(var1, {
			funnelName = p1,
			funnelSessionId = p3,
			stepNumber = var3.stepNumber,
			stepName = var3.stepName,
			customFields = p4
		})
		
		return
	end
	warn(`[Moments] Unknown funnel step '{p2}' for funnel '{p1}'`)
end