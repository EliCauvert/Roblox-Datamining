local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local AvatarInventoryModule = require(Parent.DataHydration.AvatarInventory)
local CreateComputedFunction = require(Parent.Signals).createComputed
local InventoryPagesDataModule = require(AvatarWorkshop.Constants.InventoryPagesData)
local ScreensModule = require(AvatarWorkshop.Navigation.Screens)
local _ = require(AvatarWorkshop.Stores.Creators.createAvatarStateStore)
local _ = require(AvatarWorkshop.Stores.Creators.createInventoryPageStore)
local GetAvatarStateStoreModule = require(AvatarWorkshop.Stores.Getters.getAvatarStateStore)
local GetInventoryPageStoreModule = require(AvatarWorkshop.Stores.Getters.getInventoryPageStore)
local GetOutfitAvatarStateModule = require(AvatarWorkshop.Utils.getOutfitAvatarState)
local GetOutfitKindModule = require(AvatarWorkshop.Utils.getOutfitKind)
local IsWearingOutfitModule = require(AvatarWorkshop.Utils.isWearingOutfit)

return function(p1)
	-- upvalues: GetAvatarStateStoreModule (copy), GetInventoryPageStoreModule (copy), InventoryPagesDataModule (copy), ScreensModule (copy), AvatarInventoryModule (copy), CreateComputedFunction (copy), IsWearingOutfitModule (copy), GetOutfitAvatarStateModule (copy), GetOutfitKindModule (copy)
	local P0 = p1 or {}
	local AvatarStateStore = P0.avatarStateStore or GetAvatarStateStoreModule(false)
	local AvatarsPageStore = P0.avatarsPageStore or GetInventoryPageStoreModule(InventoryPagesDataModule[ScreensModule.Inventory.Avatars])
	local InventoryStore = P0.inventoryStore or AvatarInventoryModule.getAvatarInventoryStore(false)
	
	return {
		getWornOutfit = CreateComputedFunction(function(p2)
			-- upvalues: AvatarStateStore (copy), AvatarsPageStore (copy), InventoryStore (copy), IsWearingOutfitModule (upval), GetOutfitAvatarStateModule (upval), GetOutfitKindModule (upval)
			local AvatarState = AvatarStateStore.getAvatarState(p2)
			
			if AvatarState == nil then
				return nil
			end
			local DataResult = nil
			for _, value in AvatarsPageStore.getEntries(p2) do
				DataResult = InventoryStore.getOutfit(value.itemId).data(p2)
				
				if DataResult and DataResult.outfitDetail and IsWearingOutfitModule(GetOutfitAvatarStateModule(value.itemId, DataResult.outfitDetail), GetOutfitKindModule(DataResult.itemCategory.itemSubType, DataResult.outfitDetail), AvatarState) then
					return DataResult
				end
			end
			return nil
		end),
		getIsSearchComplete = CreateComputedFunction(function(p3)
			-- upvalues: AvatarsPageStore (copy)
			return AvatarsPageStore.getLastPageReached(p3)
		end)
	}
end