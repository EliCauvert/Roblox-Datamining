local DiscoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local Parent = DiscoveryAnalytics.Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local TModule = require(Parent.t)
local ReportWarningModule = require(DiscoveryAnalytics.Points.reportWarning)
local StrictInterfaceResult = TModule.strictInterface({
	errorType = TModule.string,
	clickedUniverseId = TModule.string,
	universeId = TModule.optional(TModule.string),
	gameSetTypeId = TModule.optional(TModule.string),
	gameSetTargetId = TModule.optional(TModule.string),
	sortIndex = TModule.number,
	sortEntryIndex = TModule.optional(TModule.number)
})
local config = {
	eventName = "GameAttributionError",
	description = "Tracks failures to resolve game attribution errors",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("LuaAppGameAttributionErrorEventThrottleHundrethsPercent", 0),
	lastUpdated = { 25, 7, 30 }
}

return function(p1, p2)
	-- upvalues: StrictInterfaceResult (copy), ReportWarningModule (copy), LoggingProtocolModule (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p2)
	
	if not StrictInterfaceResultResult then
		ReportWarningModule(LoggingProtocolModule.default, "EventLogging", StrictInterfaceResultResult2)
	end
	LoggingProtocolModule.default:logRobloxTelemetryEvent(config, {
		"addSessionInfo",
		LoggingProtocolModule.StandardizedFields.addOsInfo
	}, p2, p1)
end