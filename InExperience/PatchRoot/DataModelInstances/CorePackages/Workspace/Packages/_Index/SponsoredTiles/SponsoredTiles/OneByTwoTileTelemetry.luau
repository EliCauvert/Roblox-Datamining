local telemetryService = game:GetService("TelemetryService")
local t = { GameJoin = "GameJoin", Clickout = "Clickout" }
local t_1 = {
	eventName = "OneByTwoTileActivated",
	description = "Counter for OneByTwoTileActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 5 }
}
local t_2 = {
	eventName = "OneByTwoTileCtaActivated",
	description = "Counter for OneByTwoTileCtaActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 5 }
}
local t_3 = {
	eventName = "OneByTwoTileGameJoinInitiated",
	description = "Counter for OneByTwoTileGameJoinInitiated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 5 }
}

return {
	CtaType = t,
	logOneByTwoTileActivated = function()
		-- upvalues: telemetryService (ref), t_1 (ref)
		telemetryService:LogCounter(t_1, {}, 1)
	end,
	logOneByTwoTileCtaActivated = function(p0)
		-- upvalues: telemetryService (ref), t_2 (ref)
		telemetryService:LogCounter(t_2, { customFields = { CtaType = p0 } }, 1)
	end,
	logOneByTwoTileGameJoinInitiated = function()
		-- upvalues: telemetryService (ref), t_3 (ref)
		telemetryService:LogCounter(t_3, {}, 1)
	end
}