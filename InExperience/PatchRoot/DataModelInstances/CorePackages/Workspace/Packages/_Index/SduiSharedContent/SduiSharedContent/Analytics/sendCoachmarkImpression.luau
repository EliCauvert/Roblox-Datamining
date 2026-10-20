local TelemetryService = game:GetService("TelemetryService")
local config = {
	eventName = "coachmarkImpression",
	description = "Sent when a coachmark is shown",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("CoachmarkImpressionThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 6, 16 }
}
local StandardizedFields = { "addOSInfo", "addSessionInfo" }

return function(CollectionServiceAnchorTag, HasMedia)
	-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy)
	TelemetryService:LogEvent(config, {
		standardizedFields = StandardizedFields,
		customFields = {
			collectionServiceAnchorTag = CollectionServiceAnchorTag,
			hasMedia = HasMedia
		}
	})
end