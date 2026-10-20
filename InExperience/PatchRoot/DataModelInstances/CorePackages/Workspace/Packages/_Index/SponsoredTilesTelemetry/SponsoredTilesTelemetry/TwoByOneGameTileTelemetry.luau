local TelemetryService = game:GetService("TelemetryService")
local StandardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" }
local config = {
	eventName = "TwoByOneTileActivated",
	description = "Counter for TwoByOneTileActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 16 }
}
local config1 = {
	eventName = "TwoByOneTileCtaActivated",
	description = "Counter for TwoByOneTileCtaActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 2, 23 }
}
local config2 = {
	eventName = "TwoByOneTileGameJoinInitiated",
	description = "Counter for TwoByOneTileGameJoinInitiated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 16 }
}
local config3 = {
	eventName = "TwoByOneTileViewGameDetailsActivated",
	description = "Counter for TwoByOneTileViewGameDetailsActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 2, 19 }
}

return {
	logTwoByOneTileActivated = function()
		-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy)
		TelemetryService:LogCounter(config, {
			standardizedFields = StandardizedFields,
			customFields = {}
		}, 1)
	end,
	logTwoByOneTileCtaActivated = function()
		-- upvalues: TelemetryService (copy), config1 (copy), StandardizedFields (copy)
		TelemetryService:LogCounter(config1, {
			standardizedFields = StandardizedFields,
			customFields = {}
		}, 1)
	end,
	logTwoByOneTileGameJoinInitiated = function()
		-- upvalues: TelemetryService (copy), config2 (copy), StandardizedFields (copy)
		TelemetryService:LogCounter(config2, {
			standardizedFields = StandardizedFields,
			customFields = {}
		}, 1)
	end,
	logTwoByOneTileViewGameDetailsActivated = function()
		-- upvalues: TelemetryService (copy), config3 (copy), StandardizedFields (copy)
		TelemetryService:LogCounter(config3, {
			standardizedFields = StandardizedFields,
			customFields = {}
		}, 1)
	end
}