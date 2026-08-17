local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local cryoModule = require(parent.Cryo)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local _ = require(momentsCommon.Analytics.EventNames)
local _ = require(momentsCommon.Analytics.Types)
local telemetryEmitterModule = require(momentsCommon.Analytics.telemetryEmitter)
local funnelEventActionListModule = require(momentsCommon.Analytics.FunnelEventActionList)
local sessionManagerModule = require(momentsCommon.Analytics.SessionManager)
local fireFunnelAnalyticsEventModule = require(momentsCommon.Analytics.fireFunnelAnalyticsEvent)
local fFlagMomentsAnalyticsClientEventTimestampModule = require(momentsCommon.Flags.FFlagMomentsAnalyticsClientEventTimestamp)
local getFFlagMomentsCreationSaveDraftModule = require(momentsCommon.Flags.GetFFlagMomentsCreationSaveDraft)
local var9 = socialLuaAnalyticsModule.Telemetry.new({
	name = "MomentsAnalyticsEvent",
	description = "Moments analytics events ported from moments-repo. The wire eventName is taken from the per-emission `eventName` field via `overrideName`; one config covers all moments EventNames values.",
	lastUpdated = { 2026, 5, 28 },
	eventStreamCtx = socialLuaAnalyticsModule.Analytics.Enums.Contexts.Moments,
	backendsList = {
		{
			type = "EventIngest",
			standardizedFields = if require(momentsCommon.Flags.GetFFlagMomentsAnalyticsProducerPrereqs)() then { "addSessionInfo", "addSessionId" } else nil,
			overrideName = function(p0) --[[ line: 72 ]]
				return p0.eventName
			end,
			format = function(p1, _) --[[ line: 75 ]]
				-- upvalues: fFlagMomentsAnalyticsClientEventTimestampModule (ref), cryoModule (ref)
				return if fFlagMomentsAnalyticsClientEventTimestampModule then cryoModule.Dictionary.join(p1.additionalInfo or {}, {
					client_event_timestamp_ms = DateTime.now().UnixTimestampMillis
				}) else p1.additionalInfo or {}
			end
		}
	}
})

return function(p2, p3) --[[ line: 88 | named "fireAnalyticsEvent" ]]
	-- upvalues: telemetryEmitterModule (ref), var9 (ref), funnelEventActionListModule (ref), getFFlagMomentsCreationSaveDraftModule (ref), sessionManagerModule (ref), fireFunnelAnalyticsEventModule (ref)
	telemetryEmitterModule.emit(var9, { eventName = p2, additionalInfo = p3 })
	local var10 = funnelEventActionListModule[p2]
	
	if var10 ~= nil then
		for i, v in var10 do
			if not getFFlagMomentsCreationSaveDraftModule() or not v.onlyIfSessionOpen or sessionManagerModule.getSessionId(v.funnelType) ~= nil then
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
end