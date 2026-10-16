local config = {
	[tostring(Enum.AssetType.Torso.Value)] = true,
	[tostring(Enum.AssetType.RightArm.Value)] = true,
	[tostring(Enum.AssetType.LeftArm.Value)] = true,
	[tostring(Enum.AssetType.LeftLeg.Value)] = true,
	[tostring(Enum.AssetType.RightLeg.Value)] = true,
	[tostring(Enum.AssetType.Head.Value)] = true,
	[tostring(Enum.AssetType.MoodAnimation.Value)] = true,
	[tostring(Enum.AssetType.DynamicHead.Value)] = true
}

return function(p1): boolean --[[ Line: 21 | Named "getDoesBundleHaveClothingOrAccessories" ]]
	-- upvalues: config (copy)
	if p1 then
		if p1.itemType ~= Enum.AvatarItemType.Bundle.Name then
			return false
		end
		if p1.bundleType and tostring(p1.bundleType) ~= tostring(Enum.BundleType.BodyParts.Value) then
			return false
		end
		for _, item in p1.items do
			if item.type == Enum.AvatarItemType.Asset.Name and item.type == Enum.AvatarItemType.Asset.Name and item.assetType and not config[item.assetType] then
				return true
			end
		end
	end
	return false
end