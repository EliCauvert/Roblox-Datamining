local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local GetAutocompleteLocaleModule = require(AvatarExperienceSearch.Utils.getAutocompleteLocale)
local FStringApisCdnUrl = require(Parent.SharedFlags).FStringApisCdnUrl
local FStringAXUnifiedAutocompleteVariant = require(Parent.AvatarExperienceFlags).FStringAXUnifiedAutocompleteVariant

return function(Callback, Input)
	-- upvalues: FStringApisCdnUrl (copy), GetAutocompleteLocaleModule (copy), LocalizationService (copy), HttpService (copy), FStringAXUnifiedAutocompleteVariant (copy)
	local Formatted = string.format("%sunified-autocomplete-service/v2/%s/suggest", FStringApisCdnUrl, "avatar")
	local Text = "?prefix=" .. HttpService:UrlEncode(Input) .. "&locale=" .. HttpService:UrlEncode((GetAutocompleteLocaleModule(LocalizationService.RobloxLocaleId)))
	
	if FStringAXUnifiedAutocompleteVariant ~= "" then
		Text ..= "&variant=" .. HttpService:UrlEncode(FStringAXUnifiedAutocompleteVariant)
	end
	return Callback(Formatted .. Text, "GET", { timeout = 5000 })
end