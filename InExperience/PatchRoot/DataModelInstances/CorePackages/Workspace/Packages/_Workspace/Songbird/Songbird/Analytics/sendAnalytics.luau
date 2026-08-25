local songbird = script:FindFirstAncestor("Songbird")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local cryoModule = require(songbird.Parent.Cryo)
local loggingProtocolModule = require(songbird.Parent.LoggingProtocol)
local _ = require(songbird.types)
local default = loggingProtocolModule.default
local t = {
	eventName = "NowPlayingPeekAnalytics",
	description = " Peek UI related analytics ",
	links = "https://roblox.atlassian.net/l/cp/VLpzDBz5",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = require(songbird.Flags.getFIntSongbirdTelemetryThrottle)(),
	lastUpdated = { 24, 30, 9 }
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