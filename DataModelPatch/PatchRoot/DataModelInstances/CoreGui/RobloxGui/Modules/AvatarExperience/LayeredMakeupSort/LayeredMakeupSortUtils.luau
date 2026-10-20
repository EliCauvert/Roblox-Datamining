local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AssetMetadataModule = require(Modules.AvatarExperience.Common.Models.AssetMetadata)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local LAYEREDMAKEUPORDER = AvatarExperienceCommonModule.Constants.LAYERED_MAKEUP_ORDER
local MAXMAKEUPLAYERS = AvatarExperienceCommonModule.Constants.MAX_MAKEUP_LAYERS

return {
	getEquippedAssetsBasedOnSortTable = function(List, p1, p2, List1)
		-- upvalues: AssetMetadataModule (copy), CryoModule (copy), GetTryOnItemReducerKeyFunction (copy), ConstantsModule (copy)
		if not p1 then
			return {}
		end
		local JoinResults = {}
		
		for i, value in List do
			if p1[value.typeId] and p1[value.typeId][value.id] then
				local DefaultMetadata = AssetMetadataModule.getDefaultMetadata(value.typeId)
				DefaultMetadata.order = #List - i
				JoinResults[value.typeId] = CryoModule.Dictionary.join(JoinResults[value.typeId] or {}, { [value.id] = DefaultMetadata })
			end
			if List1 then
				for i1, value1 in List1 do
					if i1 == value.id and not p2[GetTryOnItemReducerKeyFunction(i1, ConstantsModule.ItemType.Asset)] then
						local DefaultMetadata = AssetMetadataModule.getDefaultMetadata(value1)
						DefaultMetadata.order = #List - i
						JoinResults[value.typeId] = CryoModule.Dictionary.join(JoinResults[value.typeId] or {}, { [value.id] = DefaultMetadata })
					end
				end
			end
		end
		return JoinResults
	end,
	getTryOnItemsOrderBasedOnSortTable = function(List, p3)
		-- upvalues: GetTryOnItemReducerKeyFunction (copy), ConstantsModule (copy)
		if not p3 then
			return {}
		end
		local t = {}
		
		for i, value in List do
			if p3[GetTryOnItemReducerKeyFunction(value.id, ConstantsModule.ItemType.Asset)] then
				t[value.id] = #List - i
			end
		end
		return t
	end,
	getTableAndOrderAfterEquippingIntoSort = function(p4, p5)
		-- upvalues: LAYEREDMAKEUPORDER (copy), MAXMAKEUPLAYERS (copy)
		if not LAYEREDMAKEUPORDER[p5.typeId] then
			return p4, 0
		end
		local List = p4
		table.insert(List, 1, p5)
		
		if MAXMAKEUPLAYERS < #List then
			List = { table.unpack(List, 1, MAXMAKEUPLAYERS) }
		end
		return List, #List
	end,
	getSortedEquippedLayeredMakeup = function(List)
		-- upvalues: ConstantsModule (copy), LAYEREDMAKEUPORDER (copy)
		if not List then
			return nil
		end
		local Orders = {}
		local List1 = {}
		
		for TypeId, value in List do
			if not ConstantsModule.LayeredClothingOrder[TypeId] then
				for Id, value1 in value do
					if value1.isLayered then
						Orders[Id] = value1.order or LAYEREDMAKEUPORDER[TypeId]
						table.insert(List1, { id = Id, typeId = TypeId })
					end
				end
			end
		end
		table.sort(List1, function(A, B): boolean
			-- upvalues: Orders (copy)
			return Orders[B.id] < Orders[A.id]
		end)
		
		return List1
	end
}