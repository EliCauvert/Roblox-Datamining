local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local TModule = require(Parent.t)

return {
	playabilityResponseValidator = TModule.array(TModule.interface({
		universeId = TModule.number,
		isPlayable = TModule.boolean,
		playabilityStatus = TModule.optional(TModule.string)
	})),
	PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
}