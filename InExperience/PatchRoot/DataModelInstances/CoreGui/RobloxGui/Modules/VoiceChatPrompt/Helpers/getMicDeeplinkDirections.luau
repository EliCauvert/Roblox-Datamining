local RobloxTranslatorModule = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator)
local FeatureSettingsHubPromptAndroidWithDeeplink = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.AndroidWithDeeplink")
local FeatureSettingsHubPromptWindowsWithDeeplink = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.WindowsWithDeeplink")
local FeatureSettingsHubPromptAndroidWithoutDeeplink = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.AndroidWithoutDeeplink")
local FeatureSettingsHubPromptWindowsWithoutDeeplink = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.WindowsWithoutDeeplink")

return function(p1, UserInputService)
	-- upvalues: FeatureSettingsHubPromptAndroidWithDeeplink (copy), FeatureSettingsHubPromptAndroidWithoutDeeplink (copy), FeatureSettingsHubPromptWindowsWithDeeplink (copy), FeatureSettingsHubPromptWindowsWithoutDeeplink (copy)
	local Platform = UserInputService:GetPlatform()
	
	return if Platform == Enum.Platform.Android then if p1 then FeatureSettingsHubPromptAndroidWithDeeplink else FeatureSettingsHubPromptAndroidWithoutDeeplink elseif Platform == Enum.Platform.Windows then if p1 then FeatureSettingsHubPromptWindowsWithDeeplink else FeatureSettingsHubPromptWindowsWithoutDeeplink else nil
end