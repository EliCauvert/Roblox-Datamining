local t = {
	[tostring(Enum.AssetType.Torso.Value)] = true,
	[tostring(Enum.AssetType.RightArm.Value)] = true,
	[tostring(Enum.AssetType.LeftArm.Value)] = true,
	[tostring(Enum.AssetType.LeftLeg.Value)] = true,
	[tostring(Enum.AssetType.RightLeg.Value)] = true,
	[tostring(Enum.AssetType.Head.Value)] = true,
	[tostring(Enum.AssetType.MoodAnimation.Value)] = true,
	[tostring(Enum.AssetType.DynamicHead.Value)] = true
}

return function(p1)
	-- upvalues: t (ref)
	if p1 then
		if p1.itemType ~= Enum.AvatarItemType.Bundle.Name then
			return false
		elseif p1.bundleType and tostring(p1.bundleType) ~= tostring(Enum.BundleType.BodyParts.Value) then
			return false
		end
		for i, v in p1.items do
			if v.type == Enum.AvatarItemType.Asset.Name and v.type == Enum.AvatarItemType.Asset.Name and (v.assetType and not t[v.assetType]) then
				return true
			end
		end
	end
	return false
end