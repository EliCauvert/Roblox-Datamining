local itemTypeEnumModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Enums.ItemTypeEnum)

return function(p1, p2, p3)
	-- upvalues: itemTypeEnumModule (ref)
	return if p3 == itemTypeEnumModule.Asset then p1.AssetInfos[p2] elseif p3 == itemTypeEnumModule.Bundle then p1.BundleInfos[p2] else nil
end