local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(parent.Signals)
local tModule = require(parent.t)

return {
	followingResponseValidator = tModule.interface({
		UniverseId = tModule.number,
		UserId = tModule.number,
		CanFollow = tModule.boolean,
		IsFollowing = tModule.boolean,
		FollowingCountByType = tModule.optional(tModule.number),
		FollowingLimitByType = tModule.optional(tModule.number)
	})
}