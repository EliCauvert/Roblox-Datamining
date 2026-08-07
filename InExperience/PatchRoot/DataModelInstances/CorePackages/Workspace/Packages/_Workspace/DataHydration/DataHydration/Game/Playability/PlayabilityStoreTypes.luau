local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local tModule = require(parent.t)

return {
	playabilityResponseValidator = tModule.array(tModule.interface({
		universeId = tModule.number,
		isPlayable = tModule.boolean,
		playabilityStatus = tModule.optional(tModule.string)
	})),
	PlayabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
}