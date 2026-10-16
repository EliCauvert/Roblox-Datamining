local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local CryoModule = require(Parent.Cryo)
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local _ = require(MomentsCommon.Analytics.EventNames)
local _ = require(MomentsCommon.Analytics.Types)
local TelemetryEmitterModule = require(MomentsCommon.Analytics.telemetryEmitter)
local FunnelEventActionListModule = require(MomentsCommon.Analytics.FunnelEventActionList)
local SessionManagerModule = require(MomentsCommon.Analytics.SessionManager)
local FireFunnelAnalyticsEventModule = require(MomentsCommon.Analytics.fireFunnelAnalyticsEvent)
local FFlagMomentsAnalyticsClientEventTimestampModule = require(MomentsCommon.Flags.FFlagMomentsAnalyticsClientEventTimestamp)
local GetFFlagMomentsCreationSaveDraftModule = require(MomentsCommon.Flags.GetFFlagMomentsCreationSaveDraft)
local MomentsAnalyticsEvent = SocialLuaAnalyticsModule.Telemetry.new({
	name = "MomentsAnalyticsEvent",
	description = "Moments analytics events ported from moments-repo. The wire eventName is taken from the per-emission `eventName` field via `overrideName`; one config covers all moments EventNames values.",
	lastUpdated = { 2026, 5, 28 },
	eventStreamCtx = SocialLuaAnalyticsModule.Analytics.Enums.Contexts.Moments,
	backendsList = {
		{
			type = "EventIngest",
			standardizedFields = { "addSessionInfo", "addSessionId" },
			overrideName = function(p1) --[[ Line: 70 ]]
				return p1.eventName
			end,
			format = function(p1, _) --[[ Line: 73 ]]
				-- upvalues: FFlagMomentsAnalyticsClientEventTimestampModule (copy), CryoModule (copy)
				return if FFlagMomentsAnalyticsClientEventTimestampModule then CryoModule.Dictionary.join(p1.additionalInfo or {}, {
					client_event_timestamp_ms = DateTime.now().UnixTimestampMillis
				}) else p1.additionalInfo or {}
			end
		}
	}
})

return function(EventName, AdditionalInfo) --[[ Line: 86 | Named "fireAnalyticsEvent" ]]
	-- upvalues: TelemetryEmitterModule (copy), MomentsAnalyticsEvent (copy), FunnelEventActionListModule (copy), GetFFlagMomentsCreationSaveDraftModule (copy), SessionManagerModule (copy), FireFunnelAnalyticsEventModule (copy)
	TelemetryEmitterModule.emit(MomentsAnalyticsEvent, { eventName = EventName, additionalInfo = AdditionalInfo })
	local FunnelEventActionListModuleEntry = FunnelEventActionListModule[EventName]
	
	if FunnelEventActionListModuleEntry ~= nil then
		for _, value in FunnelEventActionListModuleEntry do
			if not GetFFlagMomentsCreationSaveDraftModule() or not value.onlyIfSessionOpen or SessionManagerModule.getSessionId(value.funnelType) ~= nil then
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
end