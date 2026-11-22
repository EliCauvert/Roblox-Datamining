local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local _ = require(AvatarWorkshop.Stores.Creators.createOutfitSaverStore)
local GetOutfitSaverStoreModule = require(AvatarWorkshop.Stores.Getters.getOutfitSaverStore)
local UseSignalStateFunction = require(AvatarWorkshop.Parent.SignalsReact).useSignalState

return function()
	-- upvalues: UseSignalStateFunction (copy), GetOutfitSaverStoreModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetOutfitSaverStoreModule)
	
	return {
		saveAvatarAsOutfit = UseSignalStateResult.saveAvatarAsOutfit,
		isSaving = UseSignalStateFunction(UseSignalStateResult.getIsSaving)
	}
end