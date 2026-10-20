local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local MemoizeResult = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).memoize(function(p1, p2, List)
	-- upvalues: ConstantsModule (copy), UtilsModule (copy)
	local Flag = false
	local Flag1 = false
	
	for i, value in List do
		if value.itemType == ConstantsModule.ItemType.Asset and value.itemSubType == ConstantsModule.AssetTypeIdStrings.Head then
			Flag = true
		elseif value.itemType == ConstantsModule.ItemType.Bundle then
			if value.itemSubType == ConstantsModule.BundleTypeIdStrings.DynamicHead then
				Flag1 = true
			elseif value.itemSubType == ConstantsModule.BundleTypeIdStrings.BodyParts then
				local OutfitInfoFromBundleIdNoState = UtilsModule.getOutfitInfoFromBundleIdNoState(UtilsModule.getBundleInfo(p1, i), p2)
				
				if not value.receivedBundleInfo or OutfitInfoFromBundleIdNoState == nil then
					return Flag, Flag1, false
				end
				if if OutfitInfoFromBundleIdNoState then OutfitInfoFromBundleIdNoState.containsDynamicHead else false then
					Flag1 = true
				else
					Flag = true
				end
			end
		end
	end
	return Flag, Flag1, true
end)

return function(p3)
	-- upvalues: MemoizeResult (copy)
	return MemoizeResult(p3.AvatarExperience.Common.BundleInfos, p3.AvatarExperience.AvatarEditor.OutfitInfos, p3.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems)
end