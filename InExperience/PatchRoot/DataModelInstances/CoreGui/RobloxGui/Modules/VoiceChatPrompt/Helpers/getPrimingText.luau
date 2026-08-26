local var1 = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator):FormatByKey("Feature.SettingsHub.Prompt.RestartOnMicAccessChange")

return function(p1)
	-- upvalues: var1 (ref)
	return if p1:GetPlatform() == Enum.Platform.Android then "<b>" .. var0 .. "</b>" else nil
end