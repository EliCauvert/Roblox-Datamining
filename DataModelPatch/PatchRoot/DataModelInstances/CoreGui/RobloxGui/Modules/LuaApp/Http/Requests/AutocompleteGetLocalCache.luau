local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LocalizationContextModule = require(Modules.LuaApp.LocalizationContext)
local config = { ["zh-cn"] = "zh-hans", ["zh-tw"] = "zh-hant" }
local NewResult = require(Modules.LuaApp.Http.UrlBuilder).new({
	path = "/games-autocomplete/v1/request-local-cache/{variationId}",
	query = "{cursor}&{language}",
	base = require(Modules.LuaApp.Flags.GetFStringApisCdnUrl)()
})

return function(Callback, Cursor, p1, p2)
	-- upvalues: config (copy), LocalizationContextModule (copy), NewResult (copy)
	return Callback(NewResult({
		variationId = p2 or 0,
		cursor = Cursor,
		language = config[p1] or (LocalizationContextModule.getBaseLanguage(p1 or "") or "")
	}), "GET", { maxRetryCount = 0 })
end