local var0 = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator):FormatByKey("Feature.SettingsHub.Prompt.RestartOnMicAccessChange")

return function(p0)
	-- upvalues: var0 (ref)
	return if p0:GetPlatform() == Enum.Platform.Android then "<b>" .. var0 .. "</b>" else nil
end