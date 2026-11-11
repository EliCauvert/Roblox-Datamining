local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
local AvatarWidgetBlockyUtils = {
	buildEquippedBodyStateMap = function(p1)
		-- upvalues: ConstantsModule (copy)
		local SelectedInTryOnManagers = {}
		
		for _, tryOnItem in p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
			if tryOnItem.itemType == ConstantsModule.ItemType.Bundle and tryOnItem.bundleInfo and tryOnItem.itemId == tostring(ConstantsModule.BlockyBundleId) then
				for _, value in tryOnItem.bundleInfo do
					if ConstantsModule.AssetTypeIdToCategory[value.assetType] == ConstantsModule.AssetCategories.Body then
						SelectedInTryOnManagers[value.assetType] = tryOnItem.selectedInTryOnManager
					end
				end
			end
		end
		return SelectedInTryOnManagers
	end,
	shouldUnequipBodyBeforeTryOn = function(p2): boolean
		-- upvalues: FFlagAXMISEnableMultiShopping (copy), ConstantsModule (copy)
		if FFlagAXMISEnableMultiShopping then
			return p2.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems == true
		else
			local LookType = p2.AvatarExperience.AvatarScene.OutfitTryOn.LookType
			
			return p2.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil and LookType == ConstantsModule.LookType.Avatar
		end
	end,
	buildEquippedAssetMapByHumanoidDescriptionProp = function(p2)
		-- upvalues: ConstantsModule (copy)
		local EquippedAssets = p2.AvatarExperience.AvatarEditor.Character.EquippedAssets
		local t = {}
		
		if EquippedAssets then
			for i, equippedAsset in EquippedAssets do
				local AssetTypeIdStringToHumanoidDescriptionPropEntry = ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[i]
				
				if AssetTypeIdStringToHumanoidDescriptionPropEntry then
					if not t[AssetTypeIdStringToHumanoidDescriptionPropEntry] then
						t[AssetTypeIdStringToHumanoidDescriptionPropEntry] = {}
					end
					table.insert(t[AssetTypeIdStringToHumanoidDescriptionPropEntry], equippedAsset)
				end
			end
		end
		return t
	end,
	processBlockyBundleParts = function(List)
		-- upvalues: ConstantsModule (copy)
		local config = {
			[ConstantsModule.AssetTypeIdStrings.Torso] = true,
			[ConstantsModule.AssetTypeIdStrings.RightArm] = true,
			[ConstantsModule.AssetTypeIdStrings.LeftArm] = true,
			[ConstantsModule.AssetTypeIdStrings.LeftLeg] = true,
			[ConstantsModule.AssetTypeIdStrings.RightLeg] = true,
			[ConstantsModule.AssetTypeIdStrings.DynamicHead] = true,
			[ConstantsModule.AssetTypeIdStrings.Head] = true
		}
		local Count = 7
		
		for _, value in List do
			for _, value1 in value.assetsInBundle do
				if value1.isIncluded then
					if tostring(value1.assetType) == ConstantsModule.AssetTypeIdStrings.DynamicHead or tostring(value1.assetType) == ConstantsModule.AssetTypeIdStrings.Head then
						config[ConstantsModule.AssetTypeIdStrings.DynamicHead] = nil
						config[ConstantsModule.AssetTypeIdStrings.Head] = nil
						Count -= 2
					else
						config[tostring(value1.assetType)] = nil
						Count -= 1
					end
				end
			end
		end
		if config[ConstantsModule.AssetTypeIdStrings.DynamicHead] and config[ConstantsModule.AssetTypeIdStrings.Head] then
			config[ConstantsModule.AssetTypeIdStrings.Head] = nil
			local _ = Count - 1
		end
		return config
	end
}

function AvatarWidgetBlockyUtils.buildBlockyLookDetailItem(p3, Callback)
	-- upvalues: WidgetConstants (copy), ConstantsModule (copy), AvatarWidgetBlockyUtils (copy)
	local config = {
		bundleType = 1,
		description = "",
		productId = 0,
		isPurchasable = false,
		priceInRobux = 0,
		quantityOwned = 1,
		tryOnItemOrder = 0,
		itemType = WidgetConstants.ContentType.Bundle,
		itemRestrictions = {},
		assetsInBundle = {},
		name = Callback("Feature.Avatar.Label.DefaultBody"),
		id = tostring(ConstantsModule.BlockyBundleId)
	}
	local Id = 1
	
	for i, _ in AvatarWidgetBlockyUtils.processBlockyBundleParts(p3) do
		table.insert(config.assetsInBundle, { isIncluded = true, id = Id, assetType = tonumber(i) or 0 })
		Id += 1
	end
	return if #config.assetsInBundle == 0 then nil else config
end

function AvatarWidgetBlockyUtils.adjustTryOnItemOrderForBlockyBundle(List, List1, List2)
	-- upvalues: UtilsModule (copy), ConstantsModule (copy)
	local v1 = 0
	
	for i, value in List2 do
		if not UtilsModule.isItemSelectable(value) then
			v1 = i
		end
	end
	local TryOnItemOrder = v1 + 1
	
	for _, value1 in List do
		if value1.tryOnItemOrder and TryOnItemOrder <= value1.tryOnItemOrder then
			value1.tryOnItemOrder += 1
		end
	end
	for _, value2 in List1 do
		if value2.id == tostring(ConstantsModule.BlockyBundleId) then
			value2.tryOnItemOrder = TryOnItemOrder
		elseif value2.tryOnItemOrder and TryOnItemOrder <= value2.tryOnItemOrder then
			value2.tryOnItemOrder += 1
		end
	end
end

return AvatarWidgetBlockyUtils