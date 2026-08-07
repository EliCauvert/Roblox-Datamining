local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local tModule = require(parent.t)
local _ = require(parent.Signals)

return {
	PLAY_GAME_ERROR_CODE = 6,
	votesResponseValidator = tModule.interface({
		data = tModule.array(tModule.interface({
			id = tModule.number,
			upVotes = tModule.number,
			downVotes = tModule.number
		}))
	}),
	userVoteResponseValidator = tModule.interface({
		userVote = tModule.optional(tModule.boolean),
		canVote = tModule.boolean,
		reasonForNotVoteable = tModule.optional(tModule.string)
	}),
	ReasonNotVoteable = {
		PlayGame = "PlayGame",
		FloodCheckThresholdMet = "FloodCheckThresholdMet",
		AssetNotVoteable = "AssetNotVoteable"
	}
}