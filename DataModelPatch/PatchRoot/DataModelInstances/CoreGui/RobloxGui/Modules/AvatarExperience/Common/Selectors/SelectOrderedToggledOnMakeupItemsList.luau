local CorePackages = game:GetService("CorePackages")
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = AvatarExperienceCommonModule.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local LAYEREDMAKEUPORDER = AvatarExperienceCommonModule.Constants.LAYERED_MAKEUP_ORDER
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(List, List1)
	-- upvalues: ConstantsModule (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), LAYEREDMAKEUPORDER (copy)
	local List2 = {}
	local Orders = {}
	
	if List1 ~= nil then
		for _, value in List1 do
			if value.itemType == ConstantsModule.ItemType.Asset then
				local ItemSubType = value.itemSubType
				
				if ASSETTYPEIDSTRINGTOMAKEUPTYPE[ItemSubType] then
					Orders[value.itemId] = value.order or LAYEREDMAKEUPORDER[ItemSubType]
					table.insert(List2, { id = value.itemId, typeId = ItemSubType })
				end
			elseif value.bundleInfo then
				for Id, value1 in value.bundleInfo do
					local AssetType = value1.assetType
					
					if ASSETTYPEIDSTRINGTOMAKEUPTYPE[AssetType] then
						Orders[Id] = value1.order or LAYEREDMAKEUPORDER[AssetType]
						table.insert(List2, { id = Id, typeId = AssetType })
					end
				end
			end
		end
	end
	if List ~= nil then
		for TypeId, value2 in List do
			for Id1, value3 in value2 do
				if LAYEREDMAKEUPORDER[TypeId] then
					Orders[Id1] = value3.order or LAYEREDMAKEUPORDER[TypeId]
					table.insert(List2, { id = Id1, typeId = TypeId })
				end
			end
		end
	end
	table.sort(List2, function(A, B): boolean
		-- upvalues: Orders (copy)
		return Orders[B.id] < Orders[A.id]
	end)
	
	return List2
end)

return function(p1)
	-- upvalues: MemoizeResult (copy)
	return MemoizeResult(p1.AvatarExperience.AvatarEditor.Character.EquippedAssets, p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems)
end