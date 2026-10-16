local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local TModule = require(Parent.t)
local _ = require(Parent.Signals)

return {
	PLAY_GAME_ERROR_CODE = 6,
	votesResponseValidator = TModule.interface({
		data = TModule.array((TModule.interface({
			id = TModule.number,
			upVotes = TModule.number,
			downVotes = TModule.number
		})))
	}),
	userVoteResponseValidator = TModule.interface({
		userVote = TModule.optional(TModule.boolean),
		canVote = TModule.boolean,
		reasonForNotVoteable = TModule.optional(TModule.string)
	}),
	ReasonNotVoteable = {
		PlayGame = "PlayGame",
		FloodCheckThresholdMet = "FloodCheckThresholdMet",
		AssetNotVoteable = "AssetNotVoteable"
	}
}