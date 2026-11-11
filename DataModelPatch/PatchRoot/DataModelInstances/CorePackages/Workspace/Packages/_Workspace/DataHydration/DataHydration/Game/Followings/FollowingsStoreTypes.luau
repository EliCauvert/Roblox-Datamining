local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(Parent.Signals)
local TModule = require(Parent.t)

return {
	followingResponseValidator = TModule.interface({
		UniverseId = TModule.number,
		UserId = TModule.number,
		CanFollow = TModule.boolean,
		IsFollowing = TModule.boolean,
		FollowingCountByType = TModule.optional(TModule.number),
		FollowingLimitByType = TModule.optional(TModule.number)
	})
}