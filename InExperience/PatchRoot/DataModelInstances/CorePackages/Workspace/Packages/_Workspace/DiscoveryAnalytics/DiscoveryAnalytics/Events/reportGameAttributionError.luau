local discoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local parent = discoveryAnalytics.Parent
local loggingProtocolModule = require(parent.LoggingProtocol)
local tModule = require(parent.t)
local reportWarningModule = require(discoveryAnalytics.Points.reportWarning)
local var4 = tModule.strictInterface({
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

return function(p0, p1) --[[ line: 36 | named "reportGameAttributionError" ]]
	-- upvalues: var4 (ref), reportWarningModule (ref), loggingProtocolModule (ref), t (ref)
	local var6, var7 = var4(p1)
	
	if not var6 then
		reportWarningModule(loggingProtocolModule.default, "EventLogging", var7)
	end
	loggingProtocolModule.default:logRobloxTelemetryEvent(t, {
		"addSessionInfo",
		loggingProtocolModule.StandardizedFields.addOsInfo
	}, p1, p0)
end