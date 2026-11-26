local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local InventoryPagesDataModule = require(AvatarWorkshop.Constants.InventoryPagesData)
local ScreensModule = require(AvatarWorkshop.Navigation.Screens)
local CreateOutfitSaverStoreModule = require(AvatarWorkshop.Stores.Creators.createOutfitSaverStore)
local GetInventoryPageStoreModule = require(AvatarWorkshop.Stores.Getters.getInventoryPageStore)

return require(AvatarWorkshop.Parent.Signals).createComputed(function()
	-- upvalues: CreateOutfitSaverStoreModule (copy), GetInventoryPageStoreModule (copy), InventoryPagesDataModule (copy), ScreensModule (copy)
	return CreateOutfitSaverStoreModule({
		onOutfitCreated = function()
			-- upvalues: GetInventoryPageStoreModule (upval), InventoryPagesDataModule (upval), ScreensModule (upval)
			GetInventoryPageStoreModule(InventoryPagesDataModule[ScreensModule.Inventory.Avatars]).refresh()
		end
	})
end)