local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local loggingProtocolModule = require(parent.LoggingProtocol)
local mutedError = require(parent.Loggers).mutedError
local tModule = require(parent.t)
local var2 = tModule.strictInterface({
	videoAssetId = tModule.string,
	videoPlaybackSessionId = tModule.string,
	universeId = tModule.string,
	rootPlaceId = tModule.string,
	gameSetTypeId = tModule.optional(tModule.string),
	sortPos = tModule.optional(tModule.number)
})
local t = {
	eventName = "discoveryVideoPlay",
	description = "Fire when discovery video playback session starts",
	links = "",
	backends = {
		loggingProtocolModule.TelemetryBackends.Points,
		loggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("DiscoveryVideoPlayEventHundredthsPercent", 0),
	lastUpdated = { 25, 4, 23 }
}

return function(p0, p1) --[[ line: 34 | named "discoveryVideoPlayEvent" ]]
	-- upvalues: var2 (ref), mutedError (ref), loggingProtocolModule (ref), t (ref)
	local var4, var5 = var2(p1)
	
	if not var4 then
		mutedError(var5)
	end
	loggingProtocolModule.default:logRobloxTelemetryEvent(t, {
		"addSessionInfo",
		loggingProtocolModule.StandardizedFields.addOsInfo
	}, p1, p0)
end