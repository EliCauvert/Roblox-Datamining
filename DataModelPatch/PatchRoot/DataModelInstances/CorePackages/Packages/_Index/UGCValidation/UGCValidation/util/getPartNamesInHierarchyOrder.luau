return function(AssetType)
	if Enum.AssetType.LeftArm == AssetType then
		return { "LeftUpperArm", "LeftLowerArm", "LeftHand" }
	elseif Enum.AssetType.RightArm == AssetType then
		return { "RightUpperArm", "RightLowerArm", "RightHand" }
	elseif Enum.AssetType.LeftLeg == AssetType then
		return { "LeftUpperLeg", "LeftLowerLeg", "LeftFoot" }
	elseif Enum.AssetType.RightLeg == AssetType then
		return { "RightUpperLeg", "RightLowerLeg", "RightFoot" }
	elseif Enum.AssetType.DynamicHead == AssetType then
		return { "Head" }
	elseif Enum.AssetType.Torso == AssetType then
		return { "LowerTorso", "UpperTorso" }
	else
		assert(false, "Invalid asset type")
		
		return {}
	end
end