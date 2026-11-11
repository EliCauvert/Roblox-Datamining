local Songbird = script:FindFirstAncestor("Songbird")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CryoModule = require(Songbird.Parent.Cryo)
local LoggingProtocolModule = require(Songbird.Parent.LoggingProtocol)
local _ = require(Songbird.types)
local Default = LoggingProtocolModule.default
local config = {
	eventName = "NowPlayingChromeWindowAnalytics",
	description = " Now Playing Chrome Window UI related analytics ",
	links = "https://roblox.atlassian.net/wiki/x/I4Fcqw",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = require(Songbird.Flags.getFIntSongbirdTelemetryThrottle)(),
	lastUpdated = { 24, 12, 10 }
}

return function(p1)
	-- upvalues: RbxAnalyticsService (copy), CryoModule (copy), Default (copy), config (copy)
	Default:logRobloxTelemetryEvent(config, nil, (CryoModule.Dictionary.join(p1, {
		placeid = tostring(game.PlaceId),
		sessionid = RbxAnalyticsService:GetSessionId(),
		universeid = tostring(game.GameId)
	})))
	
	return nil
end