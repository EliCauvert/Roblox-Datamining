local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetFFlagEnableNewCustomizeBundleEquipModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip)
local GetFFlagAXEnableNewInventoryItemsListModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)
local FFlagAXEditorSubcategoryFilters = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

local function isWearingAssetOrOutfit(AssetId, p1, List, p2, p3, p4, p5, p6, _)
	-- upvalues: ConstantsModule (copy), UtilsModule (copy), GetFFlagEnableNewCustomizeBundleEquipModule (copy)
	local Slot = p6.slotInfo[p6.selectedSlot]
	local IsRenderOutfitItemTiles = p1.RenderOutfitItemTiles == true
	
	if p1.PageType == ConstantsModule.PageType.Emotes then
		return if Slot then Slot.assetId == AssetId else false
	end
	if not List then
		return false
	end
	if IsRenderOutfitItemTiles and p5[AssetId] then
		return UtilsModule.isWearingOutfitNoState(p5[AssetId], p4, p2, List, p3, if GetFFlagEnableNewCustomizeBundleEquipModule() then true else nil)
	end
	for _, value in List do
		if value[AssetId] then
			return true
		end
	end
	return false
end

local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(EditableCharacterKey, p7, p8, List, p9, p10, p11, p12, p13, p14)
	-- upvalues: ConstantsModule1 (copy), CryoModule (copy), isWearingAssetOrOutfit (copy), GetFFlagAXEnableNewInventoryItemsListModule (copy)
	local t = {}
	local Flag = false
	
	if not EditableCharacterKey then
		return t, Flag
	end
	local JoinResult = if EditableCharacterKey == ConstantsModule1.EditableCharacterKey or EditableCharacterKey == ConstantsModule1.PurchasedCharacterKey then CryoModule.List.join(p8[ConstantsModule1.PurchasedCharacterKey] or {}, p8[ConstantsModule1.EditableCharacterKey] or {}) else p8[EditableCharacterKey]
	
	if not JoinResult then
		return t, Flag
	end
	for _, value in JoinResult do
		local IsWearingAssetOrOutfit = isWearingAssetOrOutfit(value, p7, List, p9, p10, p11, p12, p13, p14)
		t[value] = IsWearingAssetOrOutfit
		
		if IsWearingAssetOrOutfit then
			Flag = IsWearingAssetOrOutfit
		end
	end
	if GetFFlagAXEnableNewInventoryItemsListModule() and List or not GetFFlagAXEnableNewInventoryItemsListModule() and p7.Sort then
		local AssetTypeIdStrings = p7.AssetTypeIdStrings or {}
		for _, assetTypeIdString in AssetTypeIdStrings do
			for i, value1 in List do
				for i1, _ in value1 do
					if assetTypeIdString == i then
						t[i1] = true
						Flag = true
					end
				end
			end
		end
	end
	return t, Flag
end)

return function(p15, p16)
	-- upvalues: UtilsModule1 (copy), FFlagAXEditorSubcategoryFilters (copy), MemoizeResult (copy)
	local AvatarEditorCategoryInfoFromState = UtilsModule1.getAvatarEditorCategoryInfoFromState(p15)
	local AvatarEditorSubcategoryFilterFromState = if FFlagAXEditorSubcategoryFilters then UtilsModule1.getAvatarEditorSubcategoryFilterFromState(p15) else nil
	local AvatarEditorSubcategoryFilterFromState1 = if FFlagAXEditorSubcategoryFilters and AvatarEditorSubcategoryFilterFromState then AvatarEditorSubcategoryFilterFromState else AvatarEditorCategoryInfoFromState
	
	return MemoizeResult(p16, if FFlagAXEditorSubcategoryFilters then AvatarEditorSubcategoryFilterFromState1 else AvatarEditorCategoryInfoFromState, p15.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype, p15.AvatarExperience.AvatarEditor.Character.EquippedAssets, p15.AvatarExperience.AvatarEditor.Character.BodyColor3s, p15.AvatarExperience.AvatarEditor.Character.AvatarScales, p15.AvatarExperience.AvatarEditor.Character.AvatarType, p15.AvatarExperience.AvatarEditor.OutfitInfos, p15.AvatarExperience.AvatarEditor.EquippedEmotes, p15.AvatarExperience.AvatarEditor.Character.OutfitOrAsset)
end