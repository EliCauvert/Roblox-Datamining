local TelemetryService = game:GetService("TelemetryService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local CryoModule = require(Parent.Cryo)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local TModule = require(Parent.t)
local _ = require(VideoUtils.Analytics.VideoAnalyticsTypes)
local VideoEngagementEvents = require(VideoUtils.Analytics.Enums).VideoEngagementEvents
local t = {}
local StrictInterfaceResult = TModule.strictInterface({
	videoAssetId = TModule.string,
	source = TModule.string,
	sourceId = TModule.string,
	impressionId = TModule.optional(TModule.string),
	playbackSessionId = TModule.optional(TModule.string),
	videoAssetDuration = TModule.optional(TModule.number),
	isVisible = TModule.optional(TModule.boolean),
	isAudible = TModule.optional(TModule.boolean),
	isFullscreen = TModule.optional(TModule.boolean),
	volumeLevel = TModule.optional(TModule.number)
})
local StrictInterfaceResult1 = TModule.strictInterface({
	loadTime = TModule.optional(TModule.number),
	scrubStartTime = TModule.optional(TModule.number),
	scrubEndTime = TModule.optional(TModule.number),
	destination = TModule.optional(TModule.string)
})
local config = {
	eventName = "videoEngagementEvent",
	description = "Fire when video engagement event is triggered",
	links = "",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("VideoEngagementEventHundredthsPercent", 0),
	lastUpdated = { 25, 6, 25 }
}

return {
	reportVideoAction = function(ActionType, EventContext, p1, p2) --[[ Line: 59 ]]
		-- upvalues: StrictInterfaceResult (copy), ReportWarningFunction (copy), LoggingProtocolModule (copy), StrictInterfaceResult1 (copy), CryoModule (copy), VideoEngagementEvents (copy), t (copy), config (copy), TelemetryService (copy)
		local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p1)
		
		if not StrictInterfaceResultResult then
			ReportWarningFunction(LoggingProtocolModule.default, "EventLogging", StrictInterfaceResultResult2)
		end
		if p2 then
			local StrictInterfaceResultResult1, StrictInterfaceResultResult2_1 = StrictInterfaceResult1(p2)
			
			if not StrictInterfaceResultResult1 then
				ReportWarningFunction(LoggingProtocolModule.default, "EventLogging", StrictInterfaceResultResult2_1)
			end
		end
		TelemetryService:LogEvent(CryoModule.Dictionary.join(config, { eventContext = EventContext }), {
			standardizedFields = {
				"addSessionInfo",
				LoggingProtocolModule.StandardizedFields.addOsInfo
			},
			customFields = CryoModule.Dictionary.join(p1, {
				videoEngagementEventType = VideoEngagementEvents.VIDEO_ACTION,
				actionType = ActionType
			}, p2 or t)
		})
	end
}