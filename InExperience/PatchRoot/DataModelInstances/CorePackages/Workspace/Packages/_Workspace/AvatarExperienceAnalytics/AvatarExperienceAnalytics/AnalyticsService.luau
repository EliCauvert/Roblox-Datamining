local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local sessionService = game:GetService("SessionService")
local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local default = require(parent.LoggingProtocol).default
local analyticsModule = require(parent.Analytics)
local var1 = analyticsModule.Analytics.new(rbxAnalyticsService)
local getPlatformTarget = analyticsModule.getPlatformTarget
local AXSendSessionForEvents = game:DefineFastFlag("AXSendSessionForEvents", false)

return {
	Diag = var1.Diag,
	EventStream = {
		setRBXEventStream = function(_, p1, p2, p3)
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SetRBXEventStream(getPlatformTarget(), p1, p2, p3 or {})
		end,
		sendEventDeferred = function(_, p1, p2, p3)
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SendEventDeferred(getPlatformTarget(), p1, p2, p3 or {})
		end,
		sendEventImmediately = function(_, p1, p2, p3)
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SendEventImmediately(getPlatformTarget(), p1, p2, p3 or {})
		end,
		sendTelemetryEvent = function(_, p1, p2, p3)
			-- upvalues: default (ref), AXSendSessionForEvents (ref), sessionService (ref)
			default:logRobloxTelemetryEvent({
				throttlingPercentage = 10000,
				eventName = p2,
				backends = { default.TelemetryBackends.EventIngest }
			}, { "addSessionId", "addSessionInfo" }, p3, p1)
			
			if AXSendSessionForEvents then
				default:logRobloxTelemetryEvent({
					eventName = "sessionIdDebugEvent",
					throttlingPercentage = 10000,
					backends = { default.TelemetryBackends.EventIngest }
				}, { "addSessionInfo" }, {
					testEventName = p2,
					sessionTagL2a = sessionService:GetSessionTag("level2a")
				}, p1)
			end
		end
	}
}