local telemetryService = game:GetService("TelemetryService")
local eventIngest = require(script:FindFirstAncestor("ShareSheet").Parent.LoggingProtocol).TelemetryBackends.EventIngest
local shareSheetTelemetryThrottleHundredthsPercent = game:DefineFastInt("ShareSheetTelemetryThrottleHundredthsPercent", 10000)
local t = {
	shareSheetOpened = {
		eventName = "shareSheetOpened",
		description = "Share sheet was opened",
		backends = { eventIngest },
		throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2025, 7, 22 }
	},
	shareSheetLinkCopied = {
		eventName = "shareSheetLinkCopied",
		description = "Link was copied from share sheet",
		backends = { eventIngest },
		throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2025, 7, 22 }
	},
	shareSheetMessageSent = {
		eventName = "shareSheetMessageSent",
		description = "Message was sent from share sheet",
		backends = { eventIngest },
		throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2025, 7, 22 }
	}
}
local list = {
	"addPlaceId",
	"addUniverseId",
	"addPlaySessionId",
	"addSessionInfo"
}

return {
	logShareSheetOpened = function(p0) --[[ line: 48 ]]
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t.shareSheetOpened, { standardizedFields = list, customFields = p0 })
	end,
	logShareSheetLinkCopied = function(p1) --[[ line: 55 ]]
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t.shareSheetLinkCopied, { standardizedFields = list, customFields = p1 })
	end,
	logShareSheetMessageSent = function(p2) --[[ line: 62 ]]
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t.shareSheetMessageSent, { standardizedFields = list, customFields = p2 })
	end
}