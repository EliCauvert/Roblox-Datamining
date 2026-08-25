return function(p0)
	if Enum.AssetType.LeftArm == p0 then
		return { "LeftUpperArm", "LeftLowerArm", "LeftHand" }
	elseif Enum.AssetType.RightArm == p0 then
		return { "RightUpperArm", "RightLowerArm", "RightHand" }
	elseif Enum.AssetType.LeftLeg == p0 then
		return { "LeftUpperLeg", "LeftLowerLeg", "LeftFoot" }
	elseif Enum.AssetType.RightLeg == p0 then
		return { "RightUpperLeg", "RightLowerLeg", "RightFoot" }
	elseif Enum.AssetType.DynamicHead == p0 then
		return { "Head" }
	elseif Enum.AssetType.Torso == p0 then
		return { "LowerTorso", "UpperTorso" }
	end
	assert(false, "Invalid asset type")
	
	return {}
end