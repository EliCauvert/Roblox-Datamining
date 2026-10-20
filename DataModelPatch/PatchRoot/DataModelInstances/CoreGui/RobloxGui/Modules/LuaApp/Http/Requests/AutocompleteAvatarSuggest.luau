local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LocalizationContextModule = require(Modules.LuaApp.LocalizationContext)
local GetFStringApisCdnUrlModule = require(Modules.LuaApp.Flags.GetFStringApisCdnUrl)

return function(Callback, Input)
	-- upvalues: GetFStringApisCdnUrlModule (copy), LocalizationService (copy), LocalizationContextModule (copy), HttpService (copy)
	local Formatted = string.format("%sautocomplete-avatar/v2/suggest", (GetFStringApisCdnUrlModule()))
	local BaseLanguage = nil
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	
	if RobloxLocaleId ~= nil then
		BaseLanguage = LocalizationContextModule.getBaseLanguage(RobloxLocaleId)
	end
	if BaseLanguage == nil then
		BaseLanguage = "en"
	elseif BaseLanguage ~= "en" then
		BaseLanguage ..= ",en"
	end
	return Callback(Formatted .. ("?limit=10&prefix=" .. HttpService:UrlEncode(Input) .. "&lang=" .. HttpService:UrlEncode(BaseLanguage)), "GET", { timeout = 5000 })
end