local FFlagPlatformLeaderboardRccEnabled = require(script.Parent.SharedFlags).FFlagPlatformLeaderboardRccEnabled

return {
	["jest.config"] = script["jest.config"],
	PlatformLeaderboardTypes = require(script.PlatformLeaderboardTypes),
	PlatformLeaderboardFetcher = if FFlagPlatformLeaderboardRccEnabled then require(script.PlatformLeaderboardFetcher) else nil,
	PlatformLeaderboardConfigService = if FFlagPlatformLeaderboardRccEnabled then require(script.PlatformLeaderboardConfigService) else nil,
	PlatformLeaderboardCache = if FFlagPlatformLeaderboardRccEnabled then require(script.PlatformLeaderboardCache) else nil,
	PlatformLeaderboardController = if FFlagPlatformLeaderboardRccEnabled then require(script.PlatformLeaderboardController) else nil
}