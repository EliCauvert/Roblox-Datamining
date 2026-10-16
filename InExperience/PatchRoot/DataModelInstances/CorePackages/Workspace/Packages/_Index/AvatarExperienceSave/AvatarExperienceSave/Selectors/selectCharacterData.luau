local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local _ = require(AvatarExperienceSave.Context.AvatarSaveContext)
local FFlagAXBackgroundsPersistence = require(AvatarExperienceSave.Parent.AvatarExperienceFlags).FFlagAXBackgroundsPersistence

return function(p1) --[[ Line: 9 | Named "selectCharacterData" ]]
	-- upvalues: FFlagAXBackgroundsPersistence (copy)
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
			BackgroundAssetId = if FFlagAXBackgroundsPersistence then p1.AvatarExperience.AvatarScene.ProfileConfiguration.BackgroundAssetId else nil
		}
	}
end