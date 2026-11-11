local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(List, AssetType)
	-- upvalues: ConstantsModule (copy)
	local v1 = nil
	local ItemId = nil
	local BundleInfo = nil
	
	for _, value in List do
		if value.selectedInTryOnManager then
			local ItemRecency = value.itemRecency
			
			if value.itemType ~= ConstantsModule.ItemType.Asset then
				if value.bundleInfo then
					for i, value1 in value.bundleInfo do
						if value1.assetType == AssetType and (v1 == nil or v1 < ItemRecency) then
							v1 = ItemRecency
							ItemId = i
							BundleInfo = value.bundleInfo
						end
					end
				end
			elseif value.itemSubType == AssetType and (v1 == nil or v1 < ItemRecency) then
				v1 = ItemRecency
				ItemId = value.itemId
				BundleInfo = nil
			end
		end
	end
	return ItemId, BundleInfo, v1
end)

return function(p1, p2)
	-- upvalues: MemoizeResult (copy)
	return MemoizeResult(p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, p2)
end