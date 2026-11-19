local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local _ = require(AvatarExperienceSave.Context.AvatarSaveContext)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local FFlagSplitPaneAvatarInitialSnapshot = require(Parent.SharedFlags).FFlagSplitPaneAvatarInitialSnapshot
local FFlagAXBackgroundsPersistence = require(Parent.AvatarExperienceFlags).FFlagAXBackgroundsPersistence

return function(p1)
	-- upvalues: FFlagAXBackgroundsPersistence (copy), FFlagSplitPaneAvatarInitialSnapshot (copy), AvatarExperienceCommonModule (copy)
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
		},
		lastEquippedOutfitId = if FFlagSplitPaneAvatarInitialSnapshot then AvatarExperienceCommonModule.Stores.getEquippedAvatarOutfitIdStore(false).getLastEquippedAvatarOutfitId(false) else nil
	}
end