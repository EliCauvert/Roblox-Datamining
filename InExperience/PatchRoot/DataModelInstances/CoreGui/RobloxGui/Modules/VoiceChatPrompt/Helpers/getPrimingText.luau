local FeatureSettingsHubPromptRestartOnMicAccessChange = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator):FormatByKey("Feature.SettingsHub.Prompt.RestartOnMicAccessChange")

return function(UserInputService) --[[ Line: 14 ]]
	-- upvalues: FeatureSettingsHubPromptRestartOnMicAccessChange (copy)
	return if UserInputService:GetPlatform() == Enum.Platform.Android then "<b>" .. FeatureSettingsHubPromptRestartOnMicAccessChange .. "</b>" else nil
end