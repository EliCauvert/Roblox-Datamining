local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(parent.Signals)
local tModule = require(parent.t)

return {
	favoriteResponseValidator = tModule.interface({ isFavorited = tModule.optional(tModule.boolean) })
}