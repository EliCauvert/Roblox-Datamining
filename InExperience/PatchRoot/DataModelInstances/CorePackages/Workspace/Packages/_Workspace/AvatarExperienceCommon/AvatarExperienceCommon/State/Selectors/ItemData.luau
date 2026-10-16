local ItemTypeEnum = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceModel).Enums.ItemTypeEnum

return function(p1, p2, Asset) --[[ Line: 12 ]]
	-- upvalues: ItemTypeEnum (copy)
	return if Asset == ItemTypeEnum.Asset then p1.AssetInfos[p2] elseif Asset == ItemTypeEnum.Bundle then p1.BundleInfos[p2] else nil
end