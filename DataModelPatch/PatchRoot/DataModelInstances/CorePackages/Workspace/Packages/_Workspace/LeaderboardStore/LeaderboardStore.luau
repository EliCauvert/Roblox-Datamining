local _ = require(script.LeaderboardStoreTypes)

return {
	["jest.config"] = script["jest.config"],
	SpecialNeutralTeamName = "Neutral",
	createLeaderboardStore = require(script.createLeaderboardStore),
	dev = {
		createMockLeaderboardStore = require(script.dev.createMockLeaderboardStore)
	}
}