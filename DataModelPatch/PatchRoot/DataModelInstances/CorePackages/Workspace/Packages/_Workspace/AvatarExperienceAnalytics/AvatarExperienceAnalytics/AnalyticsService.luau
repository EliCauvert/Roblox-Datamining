local EventIngestService = game:GetService("EventIngestService")
local SessionService = game:GetService("SessionService")
local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local Default = require(Parent.LoggingProtocol).default
local AnalyticsModule = require(Parent.Analytics)
local GetPlatformTargetFunction = AnalyticsModule.getPlatformTarget
local AXSendSessionForEvents = game:DefineFastFlag("AXSendSessionForEvents", false)

return {
	Diag = AnalyticsModule.Analytics.new((game:GetService("RbxAnalyticsService"))).Diag,
	EventStream = {
		setRBXEventStream = function(_, EventContext, EventName, p1)
			-- upvalues: EventIngestService (copy), GetPlatformTargetFunction (copy)
			EventIngestService:SetRBXEventStream(GetPlatformTargetFunction(), EventContext, EventName, p1 or {})
		end,
		sendEventDeferred = function(_, EventContext, EventName, p1)
			-- upvalues: EventIngestService (copy), GetPlatformTargetFunction (copy)
			EventIngestService:SendEventDeferred(GetPlatformTargetFunction(), EventContext, EventName, p1 or {})
		end,
		sendEventImmediately = function(_, EventContext, EventName, p1)
			-- upvalues: EventIngestService (copy), GetPlatformTargetFunction (copy)
			EventIngestService:SendEventImmediately(GetPlatformTargetFunction(), EventContext, EventName, p1 or {})
		end,
		sendTelemetryEvent = function(_, p1, EventName, p2)
			-- upvalues: Default (copy), AXSendSessionForEvents (copy), SessionService (copy)
			Default:logRobloxTelemetryEvent({
				throttlingPercentage = 10000,
				eventName = EventName,
				backends = { Default.TelemetryBackends.EventIngest }
			}, { "addSessionId", "addSessionInfo" }, p2, p1)
			
			if AXSendSessionForEvents then
				Default:logRobloxTelemetryEvent({
					eventName = "sessionIdDebugEvent",
					throttlingPercentage = 10000,
					backends = { Default.TelemetryBackends.EventIngest }
				}, { "addSessionInfo" }, {
					testEventName = EventName,
					sessionTagL2a = SessionService:GetSessionTag("level2a")
				}, p1)
			end
		end
	}
}