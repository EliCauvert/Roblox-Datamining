local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local TModule = require(Parent.t)
local StrictInterfaceResult = TModule.strictInterface({
	videoAssetId = TModule.string,
	videoPlaybackSessionId = TModule.string,
	universeId = TModule.string,
	rootPlaceId = TModule.string,
	gameSetTypeId = TModule.optional(TModule.string),
	sortPos = TModule.optional(TModule.number)
})
local config = {
	eventName = "discoveryVideoLoop",
	description = "Fire when discovery video loops",
	links = "",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("DiscoveryVideoLoopEventHundredthsPercent", 0),
	lastUpdated = { 25, 4, 23 }
}

return function(p1, p2)
	-- upvalues: StrictInterfaceResult (copy), MutedErrorFunction (copy), LoggingProtocolModule (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p2)
	
	if not StrictInterfaceResultResult then
		MutedErrorFunction(StrictInterfaceResultResult2)
	end
	LoggingProtocolModule.default:logRobloxTelemetryEvent(config, {
		"addSessionInfo",
		LoggingProtocolModule.StandardizedFields.addOsInfo
	}, p2, p1)
end