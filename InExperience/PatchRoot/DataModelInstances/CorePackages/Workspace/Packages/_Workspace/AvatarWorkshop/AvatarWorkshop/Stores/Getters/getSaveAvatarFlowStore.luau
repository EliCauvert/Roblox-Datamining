local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local CreateSaveAvatarFlowStoreModule = require(AvatarWorkshop.Stores.Creators.createSaveAvatarFlowStore)
local GetWornOutfitStoreModule = require(AvatarWorkshop.Stores.Getters.getWornOutfitStore)
local GetOutfitSaverStoreModule = require(AvatarWorkshop.Stores.Getters.getOutfitSaverStore)

return require(AvatarWorkshop.Parent.Signals).createComputed(function()
	-- upvalues: CreateSaveAvatarFlowStoreModule (copy), GetOutfitSaverStoreModule (copy), GetWornOutfitStoreModule (copy)
	return CreateSaveAvatarFlowStoreModule({
		outfitSaverStore = GetOutfitSaverStoreModule(false),
		wornOutfitStore = GetWornOutfitStoreModule(false)
	})
end)