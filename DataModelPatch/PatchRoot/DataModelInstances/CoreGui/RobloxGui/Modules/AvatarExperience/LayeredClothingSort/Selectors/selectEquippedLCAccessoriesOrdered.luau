local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local MemoizeResult = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).memoize(function(List)
	-- upvalues: ConstantsModule (copy)
	local List1 = {}
	local Orders = {}
	
	for _, value in List do
		local AccessoryTypeEnumToAssetTypeIdEntry = ConstantsModule.AccessoryTypeEnumToAssetTypeId[value.AccessoryType]
		
		if not ConstantsModule.LCIgnoredForSorting[AccessoryTypeEnumToAssetTypeIdEntry] and value.IsLayered then
			Orders[tostring(value.AssetId)] = value.Order or ConstantsModule.LayeredClothingOrder[AccessoryTypeEnumToAssetTypeIdEntry]
			table.insert(List1, {
				id = tostring(value.AssetId),
				typeId = AccessoryTypeEnumToAssetTypeIdEntry
			})
		end
	end
	table.sort(List1, function(A, B): boolean
		-- upvalues: Orders (copy)
		return Orders[B.id] < Orders[A.id]
	end)
	
	return List1
end)

return function(p1)
	-- upvalues: MemoizeResult (copy)
	local CurrentCharacter = p1.AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	return if CurrentCharacter then MemoizeResult((CurrentCharacter.Humanoid.HumanoidDescription:GetAccessories(false))) else {}
end