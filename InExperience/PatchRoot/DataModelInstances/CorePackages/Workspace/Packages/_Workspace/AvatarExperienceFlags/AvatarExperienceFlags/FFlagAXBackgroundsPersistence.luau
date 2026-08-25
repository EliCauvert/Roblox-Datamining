return require(script.Parent.FFlagAXBackgroundsRoot) and (require(script.Parent.FFlagAXBackgroundsCustomizeHydration) and (game:DefineFastFlag("AXBackgroundsPersistence", false) and pcall(function()
	local _ = Enum.AvatarAssetType.AvatarBackground
	local _ = game:GetService("AvatarEditorService").PromptApplyProfileConfigurationCompleted
	assert(typeof(game:GetService("Players").GetProfileConfigurationFromUserIdAsync) == "function", "GetProfileConfigurationFromUserIdAsync is unavailable")
end)))