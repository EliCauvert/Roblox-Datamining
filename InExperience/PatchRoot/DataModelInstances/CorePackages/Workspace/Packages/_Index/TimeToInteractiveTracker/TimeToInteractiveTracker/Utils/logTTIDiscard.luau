local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local LoggingProtocolModule = require(TimeToInteractiveTracker.Parent.LoggingProtocol)
local Default = LoggingProtocolModule.default
local _ = require(TimeToInteractiveTracker.Stores.types)
local NavigationEventPrefixModule = require(TimeToInteractiveTracker.Utils.navigationEventPrefix)
local config = {
	eventName = "LuaAppNavTTIDiscarded",
	description = "NavigateTo_ TTI samples dropped instead of sent, labeled by metricName and reason (superseded, backgrounded, joinAttempt, lateFrame). superseded, backgrounded and joinAttempt skip starts that never committed a navigation.",
	links = "",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 11, 10 }
}

return function(Text: string, Reason)
	-- upvalues: NavigationEventPrefixModule (copy), Default (copy), config (copy)
	if string.sub(Text, 1, #NavigationEventPrefixModule) == NavigationEventPrefixModule then
		Default:logRobloxTelemetryCounter(config, 1, { metricName = Text, reason = Reason })
		
		return
	end
end