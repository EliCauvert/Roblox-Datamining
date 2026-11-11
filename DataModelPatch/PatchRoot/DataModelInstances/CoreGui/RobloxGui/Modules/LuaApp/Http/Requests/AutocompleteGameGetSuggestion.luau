local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local UrlModule = require(Modules.LuaApp.Http.Url)
local GetFFlagLuaAppAutocompleteIXPConfigModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppAutocompleteIXPConfig)

local function _(p1)
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.join(p1, {
		autocompleteUseCDN = CryoModule.None,
		autocompleteUseGetMethodCDN = CryoModule.None,
		autocompletePreloadedCache = CryoModule.None,
		isAvatarAutocompleteEnabled = CryoModule.None
	})
end

return function(Callback, Input, p1)
	-- upvalues: GetFFlagLuaAppAutocompleteIXPConfigModule (copy), CryoModule (copy), HttpService (copy), UrlModule (copy)
	local v1 = nil
	
	if GetFFlagLuaAppAutocompleteIXPConfigModule() then
		local Json = HttpService:JSONEncode((CryoModule.Dictionary.join(p1 or {}, {
			autocompleteUseCDN = CryoModule.None,
			autocompleteUseGetMethodCDN = CryoModule.None,
			autocompletePreloadedCache = CryoModule.None,
			isAvatarAutocompleteEnabled = CryoModule.None
		})))
		v1 = if Json == "[]" then "" else HttpService:UrlEncode(Json)
	end
	local Formatted = string.format("%sgames-autocomplete/v1/get-suggestion/%s", UrlModule.APIS_URL, (HttpService:UrlEncode(Input)))
	local Text = Formatted .. (if v1 == nil or v1 == "" then "" else "?args=" .. v1)
	
	if string.len(Text) > 2000 then
		warn("AutocompleteGameGetSuggestion URL max length exceeded", Text)
		Text = Formatted
	end
	return Callback(Text, "GET", { timeout = 5000 })
end