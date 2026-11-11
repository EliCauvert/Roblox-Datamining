local LocalizationService = game:GetService("LocalizationService")
local _ = require(game:GetService("CorePackages").Workspace.Packages.Http)
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy), LocalizationService (copy)
	return Callback(string.format("%sv1/locales/user-localization-locus-supported-locales", UrlModule.LOCALE), "GET", {
		headers = { ["Accept-Language"] = LocalizationService.SystemLocaleId }
	})
end