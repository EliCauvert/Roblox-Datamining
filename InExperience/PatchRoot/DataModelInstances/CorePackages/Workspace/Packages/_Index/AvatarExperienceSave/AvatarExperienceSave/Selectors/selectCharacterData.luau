local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)
local fFlagAXBackgroundsPersistence = require(avatarExperienceSave.Parent.AvatarExperienceFlags).FFlagAXBackgroundsPersistence

return function(p1)
	-- upvalues: fFlagAXBackgroundsPersistence (ref)
	return {
		tryOn = {
			TryOn = p1.AvatarExperience.AvatarScene.TryOn,
			OutfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn,
			LastSavedTriedOnOutfit = p1.AvatarExperience.AvatarScene.LastSavedTriedOnOutfit
		},
		equipped = {
			AvatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType,
			AvatarScales = p1.AvatarExperience.AvatarEditor.Character.AvatarScales,
			BodyColor3s = p1.AvatarExperience.AvatarEditor.Character.BodyColor3s,
			BodyPartRangeIds = p1.AvatarExperience.AvatarEditor.Character.BodyPartRangeIds,
			EquippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets,
			EquippedEmotes = p1.AvatarExperience.AvatarEditor.EquippedEmotes,
			BackgroundAssetId = if fFlagAXBackgroundsPersistence then p1.AvatarExperience.AvatarScene.ProfileConfiguration.BackgroundAssetId else nil
		}
	}
end