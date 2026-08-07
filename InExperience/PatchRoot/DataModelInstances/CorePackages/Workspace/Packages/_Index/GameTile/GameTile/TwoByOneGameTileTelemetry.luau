local telemetryService = game:GetService("TelemetryService")
local list = { "addOSInfo", "addSessionInfo", "addSessionId" }
local t = {
	eventName = "TwoByOneTileActivated",
	description = "Counter for TwoByOneTileActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 16 }
}
local t_1 = {
	eventName = "TwoByOneTileCtaActivated",
	description = "Counter for TwoByOneTileCtaActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 2, 23 }
}
local t_2 = {
	eventName = "TwoByOneTileGameJoinInitiated",
	description = "Counter for TwoByOneTileGameJoinInitiated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 16 }
}
local t_3 = {
	eventName = "TwoByOneTileViewGameDetailsActivated",
	description = "Counter for TwoByOneTileViewGameDetailsActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 2, 19 }
}

return {
	logTwoByOneTileActivated = function() --[[ line: 43 ]]
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogCounter(t, { standardizedFields = list, customFields = {} }, 1)
	end,
	logTwoByOneTileCtaActivated = function() --[[ line: 51 ]]
		-- upvalues: telemetryService (ref), t_1 (ref), list (ref)
		telemetryService:LogCounter(t_1, { standardizedFields = list, customFields = {} }, 1)
	end,
	logTwoByOneTileGameJoinInitiated = function() --[[ line: 59 ]]
		-- upvalues: telemetryService (ref), t_2 (ref), list (ref)
		telemetryService:LogCounter(t_2, { standardizedFields = list, customFields = {} }, 1)
	end,
	logTwoByOneTileViewGameDetailsActivated = function() --[[ line: 67 ]]
		-- upvalues: telemetryService (ref), t_3 (ref), list (ref)
		telemetryService:LogCounter(t_3, { standardizedFields = list, customFields = {} }, 1)
	end
}