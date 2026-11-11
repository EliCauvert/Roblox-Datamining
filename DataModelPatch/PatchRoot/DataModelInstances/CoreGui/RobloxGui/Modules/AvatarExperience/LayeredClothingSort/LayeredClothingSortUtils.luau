local CorePackages = game:GetService("CorePackages")
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AssetMetadataModule = require(Modules.AvatarExperience.Common.Models.AssetMetadata)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = AvatarExperienceCommonModule.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local FFlagFixLayeredSorting = AvatarExperienceFlagsModule.FFlagFixLayeredSorting
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport

return {
	createAssetIdToOrderMapping = MemoizeFunction(function(List)
		local t = {}
		
		for i, value in List do
			t[value.id] = { order = #List - i, assetTypeId = value.typeId }
		end
		return t
	end),
	formatForSetOrder = MemoizeFunction(function(List, p1)
		if not p1 then
			return nil
		end
		local t = {}
		
		for i, value in List do
			if p1[value.typeId] and p1[value.typeId][value.id] or value.equipped then
				t[value.id] = { order = #List - i, assetTypeId = value.typeId }
			end
		end
		return t
	end),
	formatForSetOrderWithTryOns = MemoizeFunction(function(List, p2, List1, _)
		-- upvalues: GetTryOnItemReducerKeyFunction (copy), ConstantsModule (copy)
		if not p2 then
			return nil
		end
		local t = {}
		local t1 = {}
		
		for i, value in List do
			local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(value.id, ConstantsModule.ItemType.Asset)
			
			if p2[value.typeId] and p2[value.typeId][value.id] or value.equipped then
				t[value.id] = { order = #List - i, assetTypeId = value.typeId }
			elseif List1 and List1[TryOnItemReducerKey] then
				t1[value.id] = #List - i
			else
				assert(List1 ~= nil, "tryOnItems should not be nil")
				
				for _, value1 in List1 do
					if value1.bundleInfo and value1.bundleInfo[value.id] then
						t1[value.id] = #List - i
						break
					end
				end
			end
		end
		return t, t1
	end),
	formatForEquipOutfit = MemoizeFunction(function(List, p3)
		-- upvalues: AssetMetadataModule (copy)
		if not p3 then
			return nil
		end
		local t = {}
		
		for i, value in List do
			if p3[value.typeId] and p3[value.typeId][value.id] or value.equipped then
				local DefaultMetadata = AssetMetadataModule.getDefaultMetadata(value.typeId)
				DefaultMetadata.order = #List - i
				t[value.typeId] = { [value.id] = DefaultMetadata }
			end
		end
		return t
	end),
	getTableAndOrderAfterEquippingIntoSort = MemoizeFunction(function(List, p4)
		-- upvalues: ConstantsModule (copy), MutedErrorFunction (copy), FFlagFixLayeredSorting (copy)
		if not ConstantsModule.LayeredClothingOrder[p4.typeId] then
			return List, 0
		end
		local Index = 0
		local v1 = 0
		
		for i, value in List do
			if ConstantsModule.LayeredClothingOrder[value.typeId] == nil then
				MutedErrorFunction(`getTableAndOrderAfterEquippingIntoSort could not find in layeredClothingOrder typeId: {value.typeId} assetId: {value.id}`)
			end
			if value.typeId == p4.typeId then
				Index = i
				
				if FFlagFixLayeredSorting and value.id == p4.id then
					table.remove(List, Index)
					
					return List, (math.max(0, Index - 1))
				end
			elseif Index == 0 and ConstantsModule.LayeredClothingOrder[p4.typeId] < ConstantsModule.LayeredClothingOrder[value.typeId] then
				v1 = i
			end
		end
		local Index1: number = if Index > 0 then Index elseif v1 > 0 then v1 + 1 else 1
		table.insert(List, Index1, p4)
		
		return List, #List - Index1
	end),
	getSortedEquippedLCIfNoDefault = MemoizeFunction(function(List)
		-- upvalues: FFlagAXCustomizeMakeupSupport (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), ConstantsModule (copy)
		if not List then
			return nil
		end
		local Orders = {}
		local List1 = {}
		local Flag = true
		
		for TypeId, value in List do
			if not FFlagAXCustomizeMakeupSupport or not ASSETTYPEIDSTRINGTOMAKEUPTYPE[TypeId] then
				for Id, value1 in value do
					if value1.order and value1.order ~= ConstantsModule.LayeredClothingOrder[TypeId] then
						Flag = false
					end
					if value1.isLayered then
						Orders[Id] = value1.order or ConstantsModule.LayeredClothingOrder[TypeId]
						table.insert(List1, { id = Id, typeId = TypeId })
					end
				end
			end
		end
		if Flag then
			return nil
		else
			table.sort(List1, function(A, B): boolean
				-- upvalues: Orders (copy)
				return Orders[B.id] < Orders[A.id]
			end)
			
			return List1
		end
	end)
}