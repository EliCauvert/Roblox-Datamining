local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local cryoModule = require(parent.Cryo)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local funnelEventNamesModule = require(momentsCommon.Analytics.FunnelEventNames)
local _ = require(momentsCommon.Analytics.Types)
local telemetryEmitterModule = require(momentsCommon.Analytics.telemetryEmitter)
local var5 = socialLuaAnalyticsModule.Telemetry.new({
	name = "MomentsFunnelStep",
	description = "Moments funnel-step events ported from moments-repo. funnelName/funnelSessionId/stepNumber/stepName plus any customFields are emitted as top-level EventIngest columns so downstream funnel reconstruction continues to work.",
	lastUpdated = { 2026, 5, 28 },
	eventStreamCtx = socialLuaAnalyticsModule.Analytics.Enums.Contexts.Moments,
	backendsList = {
		{
			type = "EventIngest",
			standardizedFields = if require(momentsCommon.Flags.GetFFlagMomentsAnalyticsProducerPrereqs)() then { "addSessionInfo", "addSessionId" } else nil,
			format = function(p0, _)
				-- upvalues: cryoModule (ref)
				return cryoModule.Dictionary.join(p0.customFields or {}, {
					funnelName = p0.funnelName,
					funnelSessionId = p0.funnelSessionId,
					stepNumber = p0.stepNumber,
					stepName = p0.stepName
				})
			end
		}
	}
})

return function(p1, p2, p3, p4)
	-- upvalues: funnelEventNamesModule (ref), telemetryEmitterModule (ref), var5 (ref)
	local var6 = funnelEventNamesModule.FunnelSteps[p1]
	
	if not var6 then
		warn(`[Moments] Unknown funnel type: {p1}`)
		
		return
	end
	local var7 = var6[p2]
	
	if var7 then
		telemetryEmitterModule.emit(var5, {
			funnelName = p1,
			funnelSessionId = p3,
			stepNumber = var7.stepNumber,
			stepName = var7.stepName,
			customFields = p4
		})
		
		return
	end
	warn(`[Moments] Unknown funnel step '{p2}' for funnel '{p1}'`)
end