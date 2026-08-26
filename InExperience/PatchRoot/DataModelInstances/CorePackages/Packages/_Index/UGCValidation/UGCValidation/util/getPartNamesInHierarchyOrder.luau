return function(p1)
	if Enum.AssetType.LeftArm == p1 then
		return { "LeftUpperArm", "LeftLowerArm", "LeftHand" }
	elseif Enum.AssetType.RightArm == p1 then
		return { "RightUpperArm", "RightLowerArm", "RightHand" }
	elseif Enum.AssetType.LeftLeg == p1 then
		return { "LeftUpperLeg", "LeftLowerLeg", "LeftFoot" }
	elseif Enum.AssetType.RightLeg == p1 then
		return { "RightUpperLeg", "RightLowerLeg", "RightFoot" }
	elseif Enum.AssetType.DynamicHead == p1 then
		return { "Head" }
	elseif Enum.AssetType.Torso == p1 then
		return { "LowerTorso", "UpperTorso" }
	end
	assert(false, "Invalid asset type")
	
	return {}
end