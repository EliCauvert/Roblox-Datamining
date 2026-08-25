local eventIngestService = game:GetService("EventIngestService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local sessionService = game:GetService("SessionService")
local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local default = require(parent.LoggingProtocol).default
local analyticsModule = require(parent.Analytics)
local var4 = analyticsModule.Analytics.new(rbxAnalyticsService)
local getPlatformTarget = analyticsModule.getPlatformTarget
local AXSendSessionForEvents = game:DefineFastFlag("AXSendSessionForEvents", false)

return {
	Diag = var4.Diag,
	EventStream = {
		setRBXEventStream = function(_, p0, p1, p2)
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SetRBXEventStream(getPlatformTarget(), p0, p1, p2 or {})
		end,
		sendEventDeferred = function(_, p3, p4, p5)
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SendEventDeferred(getPlatformTarget(), p3, p4, p5 or {})
		end,
		sendEventImmediately = function(_, p6, p7, p8)
			-- upvalues: eventIngestService (ref), getPlatformTarget (ref)
			eventIngestService:SendEventImmediately(getPlatformTarget(), p6, p7, p8 or {})
		end,
		sendTelemetryEvent = function(_, p9, p10, p11)
			-- upvalues: default (ref), AXSendSessionForEvents (ref), sessionService (ref)
			default:logRobloxTelemetryEvent({
				throttlingPercentage = 10000,
				eventName = p10,
				backends = { default.TelemetryBackends.EventIngest }
			}, { "addSessionId", "addSessionInfo" }, p11, p9)
			
			if AXSendSessionForEvents then
				default:logRobloxTelemetryEvent({
					eventName = "sessionIdDebugEvent",
					throttlingPercentage = 10000,
					backends = { default.TelemetryBackends.EventIngest }
				}, { "addSessionInfo" }, {
					testEventName = p10,
					sessionTagL2a = sessionService:GetSessionTag("level2a")
				}, p9)
			end
		end
	}
}