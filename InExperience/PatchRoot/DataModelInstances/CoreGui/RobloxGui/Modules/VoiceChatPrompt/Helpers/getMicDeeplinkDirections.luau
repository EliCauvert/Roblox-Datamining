local robloxTranslatorModule = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator)
local var1 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.AndroidWithDeeplink")
local var2 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.WindowsWithDeeplink")
local var3 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.AndroidWithoutDeeplink")
local var4 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.WindowsWithoutDeeplink")

return function(p1, p2)
	-- upvalues: var1 (ref), var3 (ref), var2 (ref), var4 (ref)
	local platform = p2:GetPlatform()
	
	return if platform == Enum.Platform.Android then if p1 then var1 else var3 elseif platform == Enum.Platform.Windows then if p1 then var2 else var4 else nil
end