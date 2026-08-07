local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)
local fFlagAXBackgroundsPersistence = require(avatarExperienceSave.Parent.AvatarExperienceFlags).FFlagAXBackgroundsPersistence

return function(p0) --[[ line: 9 | named "selectCharacterData" ]]
	-- upvalues: fFlagAXBackgroundsPersistence (ref)
	return {
		tryOn = {
			TryOn = p0.AvatarExperience.AvatarScene.TryOn,
			OutfitTryOn = p0.AvatarExperience.AvatarScene.OutfitTryOn,
			LastSavedTriedOnOutfit = p0.AvatarExperience.AvatarScene.LastSavedTriedOnOutfit
		},
		equipped = {
			AvatarType = p0.AvatarExperience.AvatarEditor.Character.AvatarType,
			AvatarScales = p0.AvatarExperience.AvatarEditor.Character.AvatarScales,
			BodyColor3s = p0.AvatarExperience.AvatarEditor.Character.BodyColor3s,
			BodyPartRangeIds = p0.AvatarExperience.AvatarEditor.Character.BodyPartRangeIds,
			EquippedAssets = p0.AvatarExperience.AvatarEditor.Character.EquippedAssets,
			EquippedEmotes = p0.AvatarExperience.AvatarEditor.EquippedEmotes,
			BackgroundAssetId = if fFlagAXBackgroundsPersistence then p0.AvatarExperience.AvatarScene.ProfileConfiguration.BackgroundAssetId else nil
		}
	}
end