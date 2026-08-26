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
local var1 = socialLuaAnalyticsModule.Telemetry.new({
	name = "MomentsAnalyticsEvent",
	description = "Moments analytics events ported from moments-repo. The wire eventName is taken from the per-emission `eventName` field via `overrideName`; one config covers all moments EventNames values.",
	lastUpdated = { 2026, 5, 28 },
	eventStreamCtx = socialLuaAnalyticsModule.Analytics.Enums.Contexts.Moments,
	backendsList = {
		{
			type = "EventIngest",
			standardizedFields = if require(momentsCommon.Flags.GetFFlagMomentsAnalyticsProducerPrereqs)() then { "addSessionInfo", "addSessionId" } else nil,
			overrideName = function(p1)
				return p1.eventName
			end,
			format = function(p1, _)
				-- upvalues: fFlagMomentsAnalyticsClientEventTimestampModule (ref), cryoModule (ref)
				return if fFlagMomentsAnalyticsClientEventTimestampModule then cryoModule.Dictionary.join(p1.additionalInfo or {}, {
					client_event_timestamp_ms = DateTime.now().UnixTimestampMillis
				}) else p1.additionalInfo or {}
			end
		}
	}
})

return function(p1, p2)
	-- upvalues: telemetryEmitterModule (ref), var1 (ref), funnelEventActionListModule (ref), getFFlagMomentsCreationSaveDraftModule (ref), sessionManagerModule (ref), fireFunnelAnalyticsEventModule (ref)
	telemetryEmitterModule.emit(var1, { eventName = p1, additionalInfo = p2 })
	local var2 = funnelEventActionListModule[p1]
	
	if var2 ~= nil then
		for i, v in var2 do
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