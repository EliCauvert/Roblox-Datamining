return {
	isPlaceAvatarRulesSupported = function()
		return game:GetEngineFeature("AvatarSettingsPlaceAvatarRules")
	end,
	isOverridesSchemaSupported = function()
		return game:GetEngineFeature("AvatarSettingsApiCleanup")
	end,
	isClothingOverrideRenamesSupported = function()
		return game:GetEngineFeature("AvatarSettingsClothingOverrideRenames")
	end
}