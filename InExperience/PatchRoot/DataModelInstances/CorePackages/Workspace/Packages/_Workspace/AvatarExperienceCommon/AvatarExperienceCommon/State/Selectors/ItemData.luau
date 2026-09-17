local itemTypeEnum = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceModel).Enums.ItemTypeEnum

return function(p1, p2, p3)
	-- upvalues: itemTypeEnum (ref)
	return if p3 == itemTypeEnum.Asset then p1.AssetInfos[p2] elseif p3 == itemTypeEnum.Bundle then p1.BundleInfos[p2] else nil
end