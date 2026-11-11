local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(Parent.Signals)
local TModule = require(Parent.t)

return {
	favoriteResponseValidator = TModule.interface({ isFavorited = TModule.optional(TModule.boolean) })
}