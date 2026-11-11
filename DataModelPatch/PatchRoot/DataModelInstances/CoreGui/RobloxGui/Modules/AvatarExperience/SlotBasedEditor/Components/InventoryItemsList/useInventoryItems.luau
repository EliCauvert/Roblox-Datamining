local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local InventoryItemType = AvatarExperienceSlotBasedEditorModule.Enums.InventoryItemType
local AvatarEditorCategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorCategories
local InventorySorts = AvatarExperienceSlotBasedEditorModule.Enums.InventorySorts
local InventoryFilters = AvatarExperienceSlotBasedEditorModule.Enums.InventoryFilters
local IsDurableItemExpiredFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.isDurableItemExpired
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local _ = require(script.Parent.InventoryItemsList)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local AXDisableEquippedItemUprankingInAllTab2 = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)() and game:DefineFastFlag("AXDisableEquippedItemUprankingInAllTab2", false)
local FFlagAXUprankBundlesModule = require(Modules.AvatarExperience.Flags.FFlagAXUprankBundles)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXPhotoboothIsStandalone = AvatarExperienceFlagsModule.FFlagAXPhotoboothIsStandalone
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXRemoveExpiredItemsFromInventory = AvatarExperienceFlagsModule.FFlagAXRemoveExpiredItemsFromInventory
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter
local Callback = if FFlagAXInventoryDurablesExpiredFilter then function(p1, p2)
	-- upvalues: ConstantsModule (copy)
	local t = {}
	
	if p2.AssetTypeIdStrings then
		for _, assetTypeIdString in p2.AssetTypeIdStrings do
			local GrantedAssetsByTypeEntry = p1.grantedAssetsByType[assetTypeIdString]
			
			if GrantedAssetsByTypeEntry then
				for _, value in GrantedAssetsByTypeEntry do
					t[value] = true
				end
			end
		end
	end
	if p2.BundleTypeIdStrings then
		for _, bundleTypeIdString in p2.BundleTypeIdStrings do
			local BundleTypeIdStringToOutfitTypeEntry = ConstantsModule.BundleTypeIdStringToOutfitType[bundleTypeIdString]
			local GrantedOutfitsByTypeEntry = if BundleTypeIdStringToOutfitTypeEntry then p1.grantedOutfitsByType[BundleTypeIdStringToOutfitTypeEntry] else nil
			
			if GrantedOutfitsByTypeEntry then
				for _, value1 in GrantedOutfitsByTypeEntry do
					t[value1] = true
				end
			end
		end
	end
	return t
end else nil

return function(p3, p4, p5)
	-- upvalues: UseSelectorFunction (copy), FFlagAXRemoveExpiredItemsFromInventory (copy), ReactModule (copy), UtilsModule (copy), UseSignalStateFunction (copy), FFlagAXInventoryDurablesExpiredFilter (copy), InventoryFilters (copy), AXDisableEquippedItemUprankingInAllTab2 (copy), AvatarEditorCategories (copy), InventorySorts (copy), InventoryItemType (copy), FFlagAXPhotoboothIsStandalone (copy), ConstantsModule (copy), FFlagAXUprankBundlesModule (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), CryoModule (copy), Callback (copy), IsDurableItemExpiredFunction (copy)
	local List = {}
	local UseSelectorResult = UseSelectorFunction(function(p6)
		return p6.AvatarExperience.AvatarEditor.Character.EquippedAssets
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p6)
		return p6.AvatarExperience.AvatarEditor.UprankedItems
	end)
	local UseSelectorResult2 = if FFlagAXRemoveExpiredItemsFromInventory then UseSelectorFunction(function(p6)
		return p6.AvatarExperience.Common.AssetInfos
	end) else nil
	local UseSelectorResult3 = UseSelectorFunction(function(p6)
		return p6.AvatarExperience.AvatarEditor.GrantedItems
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UtilsModule (upval), UseSelectorResult (copy), p4 (copy)
		return UtilsModule.getEquippedAssetIdsForCategory(UseSelectorResult, p4)
	end, { p4 })
	local UseSignalStateResult = UseSignalStateFunction(p5.getSortAndFilters)
	local IsFilterMatch = if FFlagAXInventoryDurablesExpiredFilter then UseSignalStateResult.filter == InventoryFilters.Expired else nil
	
	if not FFlagAXInventoryDurablesExpiredFilter or not IsFilterMatch then
		if not AXDisableEquippedItemUprankingInAllTab2 or p4.NavigationKey ~= AvatarEditorCategories.All or UseSignalStateResult.sort == InventorySorts.RecentlyWorn then
			for _, ItemId in UseMemoResult do
				table.insert(List, {
					itemId = ItemId,
					inventoryItemType = InventoryItemType.Asset
				})
			end
		end
		if FFlagAXPhotoboothIsStandalone and UseSelectorResult3 and p4.AssetTypeIdStrings or not FFlagAXPhotoboothIsStandalone and p4.AssetTypeIdStrings then
			for _, assetTypeIdString in p4.AssetTypeIdStrings do
				local GrantedAssetsByTypeEntry = UseSelectorResult3.grantedAssetsByType[assetTypeIdString]
				
				if GrantedAssetsByTypeEntry then
					for _, ItemId1 in GrantedAssetsByTypeEntry do
						table.insert(List, {
							itemId = ItemId1,
							inventoryItemType = InventoryItemType.Asset
						})
					end
				end
			end
		end
		if FFlagAXPhotoboothIsStandalone and UseSelectorResult3 and p4.BundleTypeIdStrings or not FFlagAXPhotoboothIsStandalone and p4.BundleTypeIdStrings then
			for _, bundleTypeIdString in p4.BundleTypeIdStrings do
				local BundleTypeIdStringToOutfitTypeEntry = ConstantsModule.BundleTypeIdStringToOutfitType[bundleTypeIdString]
				local GrantedOutfitsByTypeEntry = if BundleTypeIdStringToOutfitTypeEntry then UseSelectorResult3.grantedOutfitsByType[BundleTypeIdStringToOutfitTypeEntry] else nil
				
				if GrantedOutfitsByTypeEntry then
					for _, ItemId2 in GrantedOutfitsByTypeEntry do
						table.insert(List, {
							itemId = ItemId2,
							inventoryItemType = InventoryItemType.Outfit
						})
					end
				end
			end
		end
		if FFlagAXUprankBundlesModule() and UseSelectorResult1 and p4.NavigationKey ~= AvatarEditorCategories.All then
			for _, value in UseSelectorResult1 do
				local Text = tostring(value.id)
				local InventoryTypeToBundleTypeIdEntry = ConstantsModule.InventoryTypeToBundleTypeId[value.inventoryType]
				
				if InventoryTypeToBundleTypeIdEntry and p4.BundleTypeIdStrings and UtilsModule.Contains(p4.BundleTypeIdStrings, InventoryTypeToBundleTypeIdEntry) then
					table.insert(List, {
						itemId = Text,
						inventoryItemType = InventoryItemType.Outfit
					})
				end
			end
		end
	end
	local UseSignalStateResult1 = UseSignalStateFunction(p3.getItems)
	
	if UseSignalStateResult1 then
		if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then
			for _, value2 in UseSignalStateResult1 do
				local Where = CryoModule.List.findWhere(List, function(p6): boolean
					-- upvalues: value2 (copy)
					return p6.itemId == value2.itemId
				end)
				
				if Where then
					List[Where] = value2
				else
					table.insert(List, value2)
				end
			end
		else
			List = CryoModule.List.join(List, UseSignalStateResult1)
		end
	else
		for _ = 1, ConstantsModule.ShimmerCardsToDisplay do
			table.insert(List, {})
		end
	end
	local CallbackResult = if FFlagAXInventoryDurablesExpiredFilter and IsFilterMatch and UseSelectorResult3 then Callback(UseSelectorResult3, p4) else nil
	local List1 = {}
	local config = {
		[InventoryItemType.Asset] = {},
		[InventoryItemType.Outfit] = {},
		[InventoryItemType.Unknown] = {}
	}
	
	for _, value1 in List do
		local ItemId3 = value1.itemId
		local InventoryItemType1 = value1.inventoryItemType
		
		if FFlagAXRemoveExpiredItemsFromInventory and (not FFlagAXInventoryDurablesExpiredFilter or not IsFilterMatch) and (ItemId3 and InventoryItemType1 == InventoryItemType.Asset) then
			local UseSelectorResultEntry = if FFlagAXInventoryDurablesExpiredFilter then UseSelectorResult2 and UseSelectorResult2[ItemId3] else UseSelectorResult2[ItemId3]
			
			if UseSelectorResultEntry and UseSelectorResultEntry.expirationTime and IsDurableItemExpiredFunction(UseSelectorResultEntry.expirationTime) then
				continue
			end
		end
		if not FFlagAXInventoryDurablesExpiredFilter or not IsFilterMatch or not ItemId3 or not CallbackResult or not CallbackResult[ItemId3] then
			if not ItemId3 or not InventoryItemType1 then
				table.insert(List1, value1)
			elseif not config[InventoryItemType1][ItemId3] then
				config[InventoryItemType1][ItemId3] = true
				table.insert(List1, value1)
			end
		end
	end
	return List1
end