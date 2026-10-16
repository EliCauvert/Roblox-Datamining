local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local TelemetryService = game:GetService("TelemetryService")
local QueueExperimentation = require(Parent.SocialExperiments).QueueExperimentation
local IsJoinNewServerButtonEnabled = QueueExperimentation.getIsJoinNewServerButtonEnabled() or QueueExperimentation.getIsAutoJoinNewServerEnabled()
local StandardizedFields = { "addPlaceId", "addUniverseId", "addOSInfo" }
local config = {
	eventName = "loadingScreenQueuedStateButtonClick",
	description = "Event fired when the user clicks a queued-state action button on the loading screen.",
	links = "https://docs.google.com/document/d/1vbUe9xu9Hi6P7wpRpBC3jKHLXel03wCB-ezb9eJFCBc/edit?usp=sharing",
	backends = { "EventIngest" },
	throttlingPercentage = require(Parent.SharedFlags).FIntLoadingScreenQueuedStateButtonClickThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 8 }
}

return {
	countPlayerLocalizationChoiceNotReady = function() --[[ Line: 16 ]]
		-- upvalues: TelemetryService (copy), StandardizedFields (copy)
		TelemetryService:LogCounter({
			eventName = "PlayerLocalizationChoiceNotReady",
			description = "Counter to track when the auto translate badge doesn't mount before the API response arrived.",
			links = "https://grafana.rbx.com/goto/cfe9j31p1wge8a?orgId=1",
			backends = { "RobloxTelemetryCounter" },
			lastUpdated = { 2026, 2, 24 }
		}, { standardizedFields = StandardizedFields }, 1)
	end,
	countPlayerLocalizationChoiceFailed = function(p1) --[[ Line: 27 ]]
		-- upvalues: TelemetryService (copy), StandardizedFields (copy)
		TelemetryService:LogCounter({
			eventName = "PlayerLocalizationChoiceFailed",
			description = "Counter to track when the player localization choice API returns an error.",
			links = "https://grafana.rbx.com/goto/cfe9j31p1wge8a?orgId=1",
			backends = { "RobloxTelemetryCounter" },
			lastUpdated = { 2026, 2, 24 }
		}, {
			standardizedFields = StandardizedFields,
			customFields = { responseCode = p1.responseCode, errorType = p1.errorType }
		}, 1)
	end,
	countAutoTranslateZeroUniverseId = function() --[[ Line: 44 ]]
		-- upvalues: TelemetryService (copy), StandardizedFields (copy)
		TelemetryService:LogCounter({
			eventName = "AutoTranslateZeroUniverseId",
			description = "Counter to track when AutoTranslateBadge skips the API request because universeId is 0.",
			links = "https://grafana.rbx.com/goto/cfe9j31p1wge8a?orgId=1",
			backends = { "RobloxTelemetryCounter" },
			lastUpdated = { 2026, 3, 11 }
		}, { standardizedFields = StandardizedFields }, 1)
	end,
	logQueuedStateButtonClick = function(p1) --[[ Line: 64 ]]
		-- upvalues: IsJoinNewServerButtonEnabled (copy), TelemetryService (copy), config (copy)
		if IsJoinNewServerButtonEnabled then
			TelemetryService:LogEvent(config, { customFields = p1 or {} })
		end
	end
}