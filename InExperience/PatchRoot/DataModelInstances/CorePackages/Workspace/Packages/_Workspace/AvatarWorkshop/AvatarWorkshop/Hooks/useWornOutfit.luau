local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local _ = require(Parent.DataHydration.AvatarInventory)
local SignalsReactModule = require(Parent.SignalsReact)
local GetWornOutfitStoreModule = require(AvatarWorkshop.Stores.Getters.getWornOutfitStore)
local UseSignalStateFunction = SignalsReactModule.useSignalState

return function()
	-- upvalues: UseSignalStateFunction (copy), GetWornOutfitStoreModule (copy)
	return UseSignalStateFunction(UseSignalStateFunction(GetWornOutfitStoreModule).getWornOutfit)
end