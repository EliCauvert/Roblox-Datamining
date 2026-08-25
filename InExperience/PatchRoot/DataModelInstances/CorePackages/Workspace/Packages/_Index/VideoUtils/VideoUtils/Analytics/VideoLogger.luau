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
local var7 = tModule.strictInterface({
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
local var8 = tModule.strictInterface({
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
	reportVideoAction = function(p0, p1, p2, p3)
		-- upvalues: var7 (ref), reportWarning (ref), loggingProtocolModule (ref), var8 (ref), cryoModule (ref), videoEngagementEvents (ref), t (ref), t_1 (ref), telemetryService (ref)
		local var10, var11 = var7(p2)
		
		if not var10 then
			reportWarning(loggingProtocolModule.default, "EventLogging", var11)
		end
		if p3 then
			local var12, var13 = var8(p3)
			
			if not var12 then
				reportWarning(loggingProtocolModule.default, "EventLogging", var13)
			end
		end
		telemetryService:LogEvent(cryoModule.Dictionary.join(t_1, { eventContext = p1 }), {
			standardizedFields = {
				"addSessionInfo",
				loggingProtocolModule.StandardizedFields.addOsInfo
			},
			customFields = cryoModule.Dictionary.join(p2, {
				videoEngagementEventType = videoEngagementEvents.VIDEO_ACTION,
				actionType = p0
			}, p3 or t)
		})
	end
}