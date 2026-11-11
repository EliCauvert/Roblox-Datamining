local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local InventoryItemAvailability = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability

return function(p1, OnConfirm)
	-- upvalues: InventoryItemAvailability (copy), ConstantsModule (copy), ToggleEquipAssetModule (copy), AvatarScreen (copy)
	return function(p2)
		-- upvalues: InventoryItemAvailability (upval), ConstantsModule (upval), ToggleEquipAssetModule (upval), p1 (copy), AvatarScreen (upval), OnConfirm (copy)
		local State = p2:getState()
		local EquippedAssets = State.AvatarExperience.AvatarEditor.Character.EquippedAssets
		local AssetInfos = State.AvatarExperience.Common.AssetInfos
		
		if not EquippedAssets or not AssetInfos then return end
		local Items = {}
		
		for _, equippedAsset in EquippedAssets do
			for AssetId, value in equippedAsset do
				local AssetInfo = AssetInfos[AssetId]
				
				if value.availabilityStatus == InventoryItemAvailability.Unavailable or value.availabilityStatus == InventoryItemAvailability.Revoked then
					table.insert(Items, {
						categoryLoc = ConstantsModule.AssetTypeLocalized[AssetInfo.assetType],
						assetTypeId = AssetInfo.assetType,
						itemName = AssetInfo.name,
						assetId = AssetId
					})
				end
			end
		end
		if #Items > 0 then
			for _, item in Items do
				p2:dispatch(ToggleEquipAssetModule(item.assetTypeId, item.assetId))
			end
			if p1 then
				p1.navigate(AvatarScreen.ItemsUnavailablePrompt, {
					messageType = "ItemsRemovedFromAvatar",
					items = Items,
					onConfirm = OnConfirm
				})
			end
		end
	end
end