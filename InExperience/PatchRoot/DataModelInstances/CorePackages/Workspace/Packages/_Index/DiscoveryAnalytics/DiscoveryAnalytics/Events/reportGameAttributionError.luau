local discoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local parent = discoveryAnalytics.Parent
local loggingProtocolModule = require(parent.LoggingProtocol)
local tModule = require(parent.t)
local reportWarningModule = require(discoveryAnalytics.Points.reportWarning)
local var1 = tModule.strictInterface({
	errorType = tModule.string,
	clickedUniverseId = tModule.string,
	universeId = tModule.optional(tModule.string),
	gameSetTypeId = tModule.optional(tModule.string),
	gameSetTargetId = tModule.optional(tModule.string),
	sortIndex = tModule.number,
	sortEntryIndex = tModule.optional(tModule.number)
})
local t = {
	eventName = "GameAttributionError",
	description = "Tracks failures to resolve game attribution errors",
	backends = {
		loggingProtocolModule.TelemetryBackends.Points,
		loggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("LuaAppGameAttributionErrorEventThrottleHundrethsPercent", 0),
	lastUpdated = { 25, 7, 30 }
}

return function(p1, p2)
	-- upvalues: var1 (ref), reportWarningModule (ref), loggingProtocolModule (ref), t (ref)
	local var2, var3 = var1(p2)
	
	if not var2 then
		reportWarningModule(loggingProtocolModule.default, "EventLogging", var3)
	end
	loggingProtocolModule.default:logRobloxTelemetryEvent(t, {
		"addSessionInfo",
		loggingProtocolModule.StandardizedFields.addOsInfo
	}, p2, p1)
end