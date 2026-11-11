local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local LayeredClothingSortUtilsModule = require(Modules.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

local function separateSortedAssets(p1, p2, p3, EquippedAssetsToSetOrder, ItemIdToOrderMap, p4)
	if p1[p3.typeId] and p1[p3.typeId][p3.id] then
		EquippedAssetsToSetOrder[p3.id] = { assetTypeId = p3.typeId, order = #p2 - p4 }
		
		return
	else
		ItemIdToOrderMap[p3.id] = #p2 - p4
	end
end

local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(Id, Bundle, TypeId, List, p1, p2, p3, p4)
	-- upvalues: ConstantsModule (copy), LayeredClothingSortUtilsModule (copy), separateSortedAssets (copy)
	local BundleInfoMapping = {}
	local OverrideOrder = nil
	local EquippedAssetsToSetOrder = {}
	local ItemIdToOrderMap = {}
	
	if Bundle == ConstantsModule.ItemType.Bundle then
		if p2 and p2.items then
			assert(p2, "silence type checker")
			assert(p2.items, "silence type checker")
			
			for i, item in p2.items do
				local AssetType = p4[item.id] and p4[item.id].assetType
				
				if AssetType then
					local HasLayeredAssetType = ConstantsModule.LayeredAssetTypes[AssetType] ~= nil
					
					if not p1 and not ConstantsModule.LCIgnoredForSorting[AssetType] and HasLayeredAssetType then
						local TableAndOrderAfterEquippingIntoSort, TableAndOrderAfterEquippingIntoSort2 = LayeredClothingSortUtilsModule.getTableAndOrderAfterEquippingIntoSort(List, { id = item.id, typeId = AssetType })
						OverrideOrder = TableAndOrderAfterEquippingIntoSort2
						List = TableAndOrderAfterEquippingIntoSort
					end
					BundleInfoMapping[tostring(item.id)] = {
						assetType = AssetType,
						order = OverrideOrder or ConstantsModule.LayeredClothingOrder[AssetType]
					}
				end
			end
			for i, value in pairs(List) do
				if BundleInfoMapping[value.id] == nil then
					separateSortedAssets(p3, List, value, EquippedAssetsToSetOrder, ItemIdToOrderMap, i)
				end
			end
		end
	else
		local HasLayeredAssetType = ConstantsModule.LayeredAssetTypes[TypeId] ~= nil
		
		if not p1 and not ConstantsModule.LCIgnoredForSorting[TypeId] and HasLayeredAssetType then
			local TableAndOrderAfterEquippingIntoSort1, TableAndOrderAfterEquippingIntoSort2_1 = LayeredClothingSortUtilsModule.getTableAndOrderAfterEquippingIntoSort(List, { id = Id, typeId = TypeId })
			OverrideOrder = TableAndOrderAfterEquippingIntoSort2_1
			
			for i1, value1 in TableAndOrderAfterEquippingIntoSort1 do
				if value1.id ~= Id then
					separateSortedAssets(p3, TableAndOrderAfterEquippingIntoSort1, value1, EquippedAssetsToSetOrder, ItemIdToOrderMap, i1)
				end
			end
		end
	end
	return {
		overrideOrder = OverrideOrder,
		bundleInfoMapping = BundleInfoMapping,
		equippedAssetsToSetOrder = EquippedAssetsToSetOrder,
		itemIdToOrderMap = ItemIdToOrderMap
	}
end)

return function(p5, p6, p7, p8, p9, p10)
	-- upvalues: UtilsModule (copy), MemoizeResult (copy)
	return MemoizeResult(p6, p7, p8, p9, p10, UtilsModule.getBundleInfoFromState(p5, p6), p5.AvatarExperience.AvatarEditor.Character.EquippedAssets, p5.AvatarExperience.Common.AssetInfos)
end