local fFlagAXResetAvatarButton = require(script:FindFirstAncestor("AvatarExperienceControlBar").Parent.AvatarExperienceFlags).FFlagAXResetAvatarButton
local var0 = if fFlagAXResetAvatarButton then {
	Enum.AssetType.Head, Enum.AssetType.Face, Enum.AssetType.Torso,
	Enum.AssetType.RightArm, Enum.AssetType.LeftArm, Enum.AssetType.LeftLeg,
	Enum.AssetType.RightLeg, Enum.AssetType.HairAccessory,
	Enum.AssetType.ClimbAnimation, Enum.AssetType.FallAnimation,
	Enum.AssetType.IdleAnimation, Enum.AssetType.JumpAnimation,
	Enum.AssetType.RunAnimation, Enum.AssetType.SwimAnimation,
	Enum.AssetType.WalkAnimation, Enum.AssetType.EmoteAnimation,
	Enum.AssetType.EyebrowAccessory, Enum.AssetType.EyelashAccessory,
	Enum.AssetType.MoodAnimation, Enum.AssetType.DynamicHead
} else nil
local t = {}

if fFlagAXResetAvatarButton then
	for i, v in var0 do
		table.insert(t, tostring(v.Value))
	end
end
return { AssetTypesToKeep = var0, AssetTypeStringsToKeep = t }