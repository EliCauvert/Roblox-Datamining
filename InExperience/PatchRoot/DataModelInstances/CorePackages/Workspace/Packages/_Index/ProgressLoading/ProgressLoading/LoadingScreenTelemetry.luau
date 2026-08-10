local parent = script:FindFirstAncestor("ProgressLoading").Parent
local telemetryService = game:GetService("TelemetryService")
local queueExperimentation = require(parent.SocialExperiments).QueueExperimentation
local var1 = queueExperimentation.getIsJoinNewServerButtonEnabled() or queueExperimentation.getIsAutoJoinNewServerEnabled()
local list = { "addPlaceId", "addUniverseId", "addOSInfo" }
local t = {
	eventName = "loadingScreenQueuedStateButtonClick",
	description = "Event fired when the user clicks a queued-state action button on the loading screen.",
	links = "https://docs.google.com/document/d/1vbUe9xu9Hi6P7wpRpBC3jKHLXel03wCB-ezb9eJFCBc/edit?usp=sharing",
	backends = { "EventIngest" },
	throttlingPercentage = require(parent.SharedFlags).FIntLoadingScreenQueuedStateButtonClickThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 8 }
}

return {
	countPlayerLocalizationChoiceNotReady = function() --[[ line: 16 ]]
		-- upvalues: telemetryService (ref), list (ref)
		telemetryService:LogCounter({
			eventName = "PlayerLocalizationChoiceNotReady",
			description = "Counter to track when the auto translate badge doesn't mount before the API response arrived.",
			links = "https://grafana.rbx.com/goto/cfe9j31p1wge8a?orgId=1",
			backends = { "RobloxTelemetryCounter" },
			lastUpdated = { 2026, 2, 24 }
		}, { standardizedFields = list }, 1)
	end,
	countPlayerLocalizationChoiceFailed = function(p0) --[[ line: 27 ]]
		-- upvalues: telemetryService (ref), list (ref)
		telemetryService:LogCounter({
			eventName = "PlayerLocalizationChoiceFailed",
			description = "Counter to track when the player localization choice API returns an error.",
			links = "https://grafana.rbx.com/goto/cfe9j31p1wge8a?orgId=1",
			backends = { "RobloxTelemetryCounter" },
			lastUpdated = { 2026, 2, 24 }
		}, {
			standardizedFields = list,
			customFields = { responseCode = p0.responseCode, errorType = p0.errorType }
		}, 1)
	end,
	countAutoTranslateZeroUniverseId = function() --[[ line: 44 ]]
		-- upvalues: telemetryService (ref), list (ref)
		telemetryService:LogCounter({
			eventName = "AutoTranslateZeroUniverseId",
			description = "Counter to track when AutoTranslateBadge skips the API request because universeId is 0.",
			links = "https://grafana.rbx.com/goto/cfe9j31p1wge8a?orgId=1",
			backends = { "RobloxTelemetryCounter" },
			lastUpdated = { 2026, 3, 11 }
		}, { standardizedFields = list }, 1)
	end,
	logQueuedStateButtonClick = function(p1) --[[ line: 64 ]]
		-- upvalues: var1 (ref), telemetryService (ref), t (ref)
		if var1 then
			telemetryService:LogEvent(t, { customFields = p1 or {} })
		end
	end
}