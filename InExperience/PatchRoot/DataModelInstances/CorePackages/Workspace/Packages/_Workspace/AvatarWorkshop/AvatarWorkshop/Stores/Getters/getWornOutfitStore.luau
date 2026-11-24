local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local CreateWornOutfitStoreModule = require(AvatarWorkshop.Stores.Creators.createWornOutfitStore)

return require(AvatarWorkshop.Parent.Signals).createComputed(function()
	-- upvalues: CreateWornOutfitStoreModule (copy)
	return CreateWornOutfitStoreModule()
end)