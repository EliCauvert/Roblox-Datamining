local FFlagAXResetAvatarButton = require(script:FindFirstAncestor("AvatarExperienceControlBar").Parent.AvatarExperienceFlags).FFlagAXResetAvatarButton
local List = if FFlagAXResetAvatarButton then {
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
local AssetTypeStringsToKeep = {}

if FFlagAXResetAvatarButton then
	for _, value in List do
		table.insert(AssetTypeStringsToKeep, (tostring(value.Value)))
	end
end
return {
	AssetTypesToKeep = List,
	AssetTypeStringsToKeep = AssetTypeStringsToKeep
}