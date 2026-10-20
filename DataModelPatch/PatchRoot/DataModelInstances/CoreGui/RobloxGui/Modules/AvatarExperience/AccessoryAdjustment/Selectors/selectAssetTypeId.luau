local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils

local function v5(EquippedAssets, SelectedAccessory)
	for i, equippedAsset in EquippedAssets do
		for i1, _ in equippedAsset do
			if SelectedAccessory == i1 then
				return i
			end
		end
	end
	return nil
end

local function v6(TryOnItems, BundleInfos, AssetInfos, SelectedAccessory)
	local AssetInfo = nil
	for _, tryOnItem in TryOnItems do
		if tryOnItem.itemType == "Asset" and tryOnItem.itemId == SelectedAccessory then
			return tryOnItem.itemSubType
		elseif tryOnItem.itemType == "Bundle" then
			local BundleInfo = BundleInfos[tryOnItem.itemId]
			
			if BundleInfo then
				local Items = BundleInfo.items
				
				if Items ~= nil then
					for _, item in Items do
						if item.type == "Asset" and item.id == SelectedAccessory then
							AssetInfo = AssetInfos[item.id]
							
							if AssetInfo and AssetInfo.assetType then
								return AssetInfo.assetType
							end
						end
					end
				end
			end
		end
	end
	return nil
end

local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(p1, p2, p3, p4, p5)
	-- upvalues: v6 (copy), v5 (copy)
	local v1 = v6(p1, p3, p4, p5)
	
	if v1 then
		return v1
	else
		local v2 = v5(p2, p5)
		
		return if v2 then v2 else nil
	end
end)

return function(p1)
	-- upvalues: FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils (copy), v6 (copy), v5 (copy), MemoizeResult (copy)
	local TryOnItems = p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local BundleInfos = p1.AvatarExperience.Common.BundleInfos
	local AssetInfos = p1.AvatarExperience.Common.AssetInfos
	local EquippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
	local SelectedAccessory = p1.AvatarExperience.AccessoryAdjustment.SelectedAccessory
	
	if not FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils then
		return MemoizeResult(TryOnItems, EquippedAssets, BundleInfos, AssetInfos, SelectedAccessory)
	end
	local v1 = v6(TryOnItems, BundleInfos, AssetInfos, SelectedAccessory)
	
	if v1 then
		return v1
	else
		local v2 = v5(EquippedAssets, SelectedAccessory)
		
		return if v2 then v2 else nil
	end
end