local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local socialLuaAnalyticsModule = require(momentsCommon.Parent.SocialLuaAnalytics)
local _ = require(momentsCommon.Analytics.EventNames)
local _ = require(momentsCommon.Analytics.Types)
local telemetryEmitterModule = require(momentsCommon.Analytics.telemetryEmitter)
local funnelEventActionListModule = require(momentsCommon.Analytics.FunnelEventActionList)
local sessionManagerModule = require(momentsCommon.Analytics.SessionManager)
local fireFunnelAnalyticsEventModule = require(momentsCommon.Analytics.fireFunnelAnalyticsEvent)
local var6 = socialLuaAnalyticsModule.Telemetry.new({
	name = "MomentsAnalyticsEvent",
	description = "Moments analytics events ported from moments-repo. The wire eventName is taken from the per-emission `eventName` field via `overrideName`; one config covers all moments EventNames values.",
	lastUpdated = { 2026, 5, 28 },
	eventStreamCtx = socialLuaAnalyticsModule.Analytics.Enums.Contexts.Moments,
	backendsList = {
		{
			type = "EventIngest",
			standardizedFields = if require(momentsCommon.Flags.GetFFlagMomentsAnalyticsProducerPrereqs)() then { "addSessionInfo", "addSessionId" } else nil,
			overrideName = function(p0) --[[ line: 69 ]]
				return p0.eventName
			end,
			format = function(p1, _) --[[ line: 72 ]]
				return p1.additionalInfo or {}
			end
		}
	}
})

return function(p2, p3) --[[ line: 79 | named "fireAnalyticsEvent" ]]
	-- upvalues: telemetryEmitterModule (ref), var6 (ref), funnelEventActionListModule (ref), sessionManagerModule (ref), fireFunnelAnalyticsEventModule (ref)
	telemetryEmitterModule.emit(var6, { eventName = p2, additionalInfo = p3 })
	local var7 = funnelEventActionListModule[p2]
	
	if var7 ~= nil then
		for i, v in var7 do
			local funnelType = sessionManagerModule.getSessionId(v.funnelType) or sessionManagerModule.startSession(v.funnelType)
			
			if v.endSession then
				sessionManagerModule.endSession(v.funnelType)
			end
			if v.stepKey ~= nil then
				fireFunnelAnalyticsEventModule(v.funnelType, v.stepKey, funnelType)
			end
		end
	end
end