local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(List, List1)
	-- upvalues: ConstantsModule (copy), FFlagAXCustomizeMakeupSupport (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy)
	local List2 = {}
	local Orders = {}
	local t = {}
	local Flag = true
	
	if not List or not List1 then
		return {}, Flag
	end
	for _, value in List1 do
		if value.itemType == ConstantsModule.ItemType.Asset then
			local ItemSubType = value.itemSubType
			
			if not ConstantsModule.LCIgnoredForSorting[ItemSubType] and value.isLayered and (not FFlagAXCustomizeMakeupSupport or not ASSETTYPEIDSTRINGTOMAKEUPTYPE[ItemSubType]) then
				t[ItemSubType] = true
				Orders[value.itemId] = value.order or ConstantsModule.LayeredClothingOrder[ItemSubType]
				
				if value.order and value.order ~= ConstantsModule.LayeredClothingOrder[ItemSubType] then
					Flag = false
				end
				table.insert(List2, { id = value.itemId, typeId = ItemSubType })
			end
		elseif value.bundleInfo then
			for Id, value1 in value.bundleInfo do
				local AssetType = value1.assetType
				local HasLayeredAssetType = ConstantsModule.LayeredAssetTypes[AssetType] ~= nil
				
				if not ConstantsModule.LCIgnoredForSorting[AssetType] and HasLayeredAssetType and (not FFlagAXCustomizeMakeupSupport or not ASSETTYPEIDSTRINGTOMAKEUPTYPE[AssetType]) then
					t[AssetType] = true
					Orders[Id] = value1.order or ConstantsModule.LayeredClothingOrder[AssetType]
					
					if value1.order and value1.order ~= ConstantsModule.LayeredClothingOrder[AssetType] then
						Flag = false
					end
					table.insert(List2, { id = Id, typeId = AssetType })
				end
			end
		end
	end
	for TypeId, value2 in List do
		for Id1, value3 in value2 do
			if not t[TypeId] and not ConstantsModule.LCIgnoredForSorting[TypeId] and value3.isLayered and (not FFlagAXCustomizeMakeupSupport or not ASSETTYPEIDSTRINGTOMAKEUPTYPE[TypeId]) then
				Orders[Id1] = value3.order or ConstantsModule.LayeredClothingOrder[TypeId]
				
				if value3.order and value3.order ~= ConstantsModule.LayeredClothingOrder[TypeId] then
					Flag = false
				end
				table.insert(List2, { id = Id1, typeId = TypeId })
			end
		end
	end
	if Flag then
		return {}, Flag
	else
		table.sort(List2, function(A, B): boolean
			-- upvalues: Orders (copy)
			return Orders[B.id] < Orders[A.id]
		end)
		
		return List2, Flag
	end
end)

return function(p1)
	-- upvalues: MemoizeResult (copy)
	return MemoizeResult(p1.AvatarExperience.AvatarEditor.Character.EquippedAssets, p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems)
end