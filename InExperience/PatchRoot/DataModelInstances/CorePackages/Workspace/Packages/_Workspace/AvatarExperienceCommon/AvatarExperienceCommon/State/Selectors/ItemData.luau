local itemTypeEnumModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Enums.ItemTypeEnum)

return function(p0, p1, p2)
	-- upvalues: itemTypeEnumModule (ref)
	return if p2 == itemTypeEnumModule.Asset then p0.AssetInfos[p1] elseif p2 == itemTypeEnumModule.Bundle then p0.BundleInfos[p1] else nil
end