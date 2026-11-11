return {
	["jest.config"] = script["jest.config"],
	PlatformLeaderboardClientStore = if game:DefineFastFlag("PlatformLeaderboardEnabled_DEV", false) then require(script.PlatformLeaderboardClientStore) else nil
}