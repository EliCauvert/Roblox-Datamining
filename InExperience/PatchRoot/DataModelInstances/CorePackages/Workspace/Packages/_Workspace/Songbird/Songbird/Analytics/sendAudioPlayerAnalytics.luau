local Songbird = script:FindFirstAncestor("Songbird")
local LoggingProtocolModule = require(Songbird.Parent.LoggingProtocol)
local _ = require(Songbird.Analytics.AnalyticActions)
local config = {
	eventName = "AudioPlayerEvents",
	description = " Analytics for AudioPlayer component to track playback, favoriting, and reporting flows ",
	links = "",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = require(Songbird.Flags.getFIntSongbirdTelemetryThrottle)(),
	lastUpdated = { 25, 10, 24 }
}

local function createCounterEventConfig(Action) --[[ Line: 23 ]]
	-- upvalues: config (copy), LoggingProtocolModule (copy)
	return {
		eventName = `{config.eventName}_{Action}`,
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		throttlingPercentage = config.throttlingPercentage,
		lastUpdated = config.lastUpdated,
		description = config.description,
		links = config.links
	}
end

return function(p1) --[[ Line: 45 | Named "sendAudioPlayerAnalytics" ]]
	-- upvalues: createCounterEventConfig (copy), LoggingProtocolModule (copy), config (copy)
	local CounterEventConfig = createCounterEventConfig(p1.action)
	LoggingProtocolModule.default:logRobloxTelemetryEvent(config, nil, p1)
	LoggingProtocolModule.default:logRobloxTelemetryCounter(CounterEventConfig, 1)
end