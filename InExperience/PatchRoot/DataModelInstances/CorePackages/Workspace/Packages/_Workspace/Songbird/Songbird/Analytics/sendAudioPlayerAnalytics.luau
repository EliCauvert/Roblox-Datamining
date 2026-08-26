local songbird = script:FindFirstAncestor("Songbird")
local loggingProtocolModule = require(songbird.Parent.LoggingProtocol)
local _ = require(songbird.Analytics.AnalyticActions)
local t = {
	eventName = "AudioPlayerEvents",
	description = " Analytics for AudioPlayer component to track playback, favoriting, and reporting flows ",
	links = "",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = require(songbird.Flags.getFIntSongbirdTelemetryThrottle)(),
	lastUpdated = { 25, 10, 24 }
}

local function createCounterEventConfig(p1)
	-- upvalues: t (ref), loggingProtocolModule (ref)
	return {
		eventName = `{t.eventName}_{p1}`,
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = t.throttlingPercentage,
		lastUpdated = t.lastUpdated,
		description = t.description,
		links = t.links
	}
end

return function(p1)
	-- upvalues: createCounterEventConfig (ref), loggingProtocolModule (ref), t (ref)
	local var1 = createCounterEventConfig(p1.action)
	loggingProtocolModule.default:logRobloxTelemetryEvent(t, nil, p1)
	loggingProtocolModule.default:logRobloxTelemetryCounter(var1, 1)
end