local songbird = script:FindFirstAncestor("Songbird")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local cryoModule = require(songbird.Parent.Cryo)
local loggingProtocolModule = require(songbird.Parent.LoggingProtocol)
local _ = require(songbird.types)
local default = loggingProtocolModule.default
local t = {
	eventName = "NowPlayingChromeWindowAnalytics",
	description = " Now Playing Chrome Window UI related analytics ",
	links = "https://roblox.atlassian.net/wiki/x/I4Fcqw",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = require(songbird.Flags.getFIntSongbirdTelemetryThrottle)(),
	lastUpdated = { 24, 12, 10 }
}

return function(p0)
	-- upvalues: rbxAnalyticsService (ref), cryoModule (ref), default (ref), t (ref)
	default:logRobloxTelemetryEvent(t, nil, cryoModule.Dictionary.join(p0, {
		placeid = tostring(game.PlaceId),
		sessionid = rbxAnalyticsService:GetSessionId(),
		universeid = tostring(game.GameId)
	}))
	
	return nil
end