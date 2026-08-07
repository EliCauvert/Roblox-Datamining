local fFlagPlatformLeaderboardRccEnabled = require(script.Parent.SharedFlags).FFlagPlatformLeaderboardRccEnabled

return {
	["jest.config"] = script["jest.config"],
	PlatformLeaderboardTypes = require(script.PlatformLeaderboardTypes),
	PlatformLeaderboardFetcher = if fFlagPlatformLeaderboardRccEnabled then require(script.PlatformLeaderboardFetcher) else nil,
	PlatformLeaderboardConfigService = if fFlagPlatformLeaderboardRccEnabled then require(script.PlatformLeaderboardConfigService) else nil,
	PlatformLeaderboardCache = if fFlagPlatformLeaderboardRccEnabled then require(script.PlatformLeaderboardCache) else nil,
	PlatformLeaderboardController = if fFlagPlatformLeaderboardRccEnabled then require(script.PlatformLeaderboardController) else nil
}