local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Reducers.AvatarExperience)
local _ = require(Modules.AvatarExperience.Common.Types)
local ItemInfoModule = require(Modules.AvatarExperience.Common.Models.ItemInfo)

return function(p1, p2, Asset)
	-- upvalues: ConstantsModule (copy), ItemInfoModule (copy)
	local Common = p1.Common
	local AvatarEditor = p1.AvatarEditor
	
	if Asset == ConstantsModule.ItemType.Asset then
		if Common then
			local AssetInfo = Common.AssetInfos[p2]
			
			if AssetInfo then
				return ItemInfoModule.fromAssetInfo(AssetInfo)
			end
		end
	elseif Asset == ConstantsModule.ItemType.Bundle then
		if Common then
			local BundleInfo = Common.BundleInfos[p2]
			
			if BundleInfo then
				return ItemInfoModule.fromBundleInfo(BundleInfo)
			end
		end
	elseif Asset == ConstantsModule.ItemType.Outfit and AvatarEditor then
		local OutfitInfo = AvatarEditor.OutfitInfos[p2]
		
		if OutfitInfo then
			return ItemInfoModule.fromOutfitInfo(OutfitInfo)
		end
	end
	return nil
end