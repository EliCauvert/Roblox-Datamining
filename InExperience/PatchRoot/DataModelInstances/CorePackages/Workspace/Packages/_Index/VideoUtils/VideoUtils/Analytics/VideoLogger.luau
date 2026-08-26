local telemetryService = game:GetService("TelemetryService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local cryoModule = require(parent.Cryo)
local loggingProtocolModule = require(parent.LoggingProtocol)
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local tModule = require(parent.t)
local _ = require(videoUtils.Analytics.VideoAnalyticsTypes)
local videoEngagementEvents = require(videoUtils.Analytics.Enums).VideoEngagementEvents
local videoEngagementEventHundredthsPercent = game:DefineFastInt("VideoEngagementEventHundredthsPercent", 0)
local t = {}
local var1 = tModule.strictInterface({
	videoAssetId = tModule.string,
	source = tModule.string,
	sourceId = tModule.string,
	impressionId = tModule.optional(tModule.string),
	playbackSessionId = tModule.optional(tModule.string),
	videoAssetDuration = tModule.optional(tModule.number),
	isVisible = tModule.optional(tModule.boolean),
	isAudible = tModule.optional(tModule.boolean),
	isFullscreen = tModule.optional(tModule.boolean),
	volumeLevel = tModule.optional(tModule.number)
})
local var2 = tModule.strictInterface({
	loadTime = tModule.optional(tModule.number),
	scrubStartTime = tModule.optional(tModule.number),
	scrubEndTime = tModule.optional(tModule.number),
	destination = tModule.optional(tModule.string)
})
local t_1 = {
	eventName = "videoEngagementEvent",
	description = "Fire when video engagement event is triggered",
	links = "",
	backends = {
		loggingProtocolModule.TelemetryBackends.Points,
		loggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = videoEngagementEventHundredthsPercent,
	lastUpdated = { 25, 6, 25 }
}

return {
	reportVideoAction = function(p1, p2, p3, p4)
		-- upvalues: var1 (ref), reportWarning (ref), loggingProtocolModule (ref), var2 (ref), cryoModule (ref), videoEngagementEvents (ref), t (ref), t_1 (ref), telemetryService (ref)
		local var3, var4 = var1(p3)
		
		if not var3 then
			reportWarning(loggingProtocolModule.default, "EventLogging", var4)
		end
		if p4 then
			local var5, var6 = var2(p4)
			
			if not var5 then
				reportWarning(loggingProtocolModule.default, "EventLogging", var6)
			end
		end
		telemetryService:LogEvent(cryoModule.Dictionary.join(t_1, { eventContext = p2 }), {
			standardizedFields = {
				"addSessionInfo",
				loggingProtocolModule.StandardizedFields.addOsInfo
			},
			customFields = cryoModule.Dictionary.join(p3, {
				videoEngagementEventType = videoEngagementEvents.VIDEO_ACTION,
				actionType = p1
			}, p4 or t)
		})
	end
}