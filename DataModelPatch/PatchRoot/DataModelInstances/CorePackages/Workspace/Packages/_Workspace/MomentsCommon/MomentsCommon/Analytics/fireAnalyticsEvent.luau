local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local SocialLuaAnalyticsModule = require(MomentsCommon.Parent.SocialLuaAnalytics)
local _ = require(MomentsCommon.Analytics.EventNames)
local _ = require(MomentsCommon.Analytics.Types)
local TelemetryEmitterModule = require(MomentsCommon.Analytics.telemetryEmitter)
local FunnelEventActionListModule = require(MomentsCommon.Analytics.FunnelEventActionList)
local SessionManagerModule = require(MomentsCommon.Analytics.SessionManager)
local FireFunnelAnalyticsEventModule = require(MomentsCommon.Analytics.fireFunnelAnalyticsEvent)
local MomentsAnalyticsEvent = SocialLuaAnalyticsModule.Telemetry.new({
	name = "MomentsAnalyticsEvent",
	description = "Moments analytics events ported from moments-repo. The wire eventName is taken from the per-emission `eventName` field via `overrideName`; one config covers all moments EventNames values.",
	lastUpdated = { 2026, 5, 28 },
	eventStreamCtx = SocialLuaAnalyticsModule.Analytics.Enums.Contexts.Moments,
	backendsList = {
		{
			type = "EventIngest",
			standardizedFields = if require(MomentsCommon.Flags.GetFFlagMomentsAnalyticsProducerPrereqs)() then { "addSessionInfo", "addSessionId" } else nil,
			overrideName = function(p1)
				return p1.eventName
			end,
			format = function(p1, _)
				return p1.additionalInfo or {}
			end
		}
	}
})

return function(EventName, AdditionalInfo)
	-- upvalues: TelemetryEmitterModule (copy), MomentsAnalyticsEvent (copy), FunnelEventActionListModule (copy), SessionManagerModule (copy), FireFunnelAnalyticsEventModule (copy)
	TelemetryEmitterModule.emit(MomentsAnalyticsEvent, { eventName = EventName, additionalInfo = AdditionalInfo })
	local FunnelEventActionListModuleEntry = FunnelEventActionListModule[EventName]
	
	if FunnelEventActionListModuleEntry ~= nil then
		for _, value in FunnelEventActionListModuleEntry do
			local SessionId = SessionManagerModule.getSessionId(value.funnelType) or SessionManagerModule.startSession(value.funnelType)
			
			if value.endSession then
				SessionManagerModule.endSession(value.funnelType)
			end
			if value.stepKey ~= nil then
				FireFunnelAnalyticsEventModule(value.funnelType, value.stepKey, SessionId)
			end
		end
	end
end