local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")

return function(Input): string
	-- upvalues: HttpService (copy), LocalizationService (copy)
	return string.format("SearchAutocomplete-%s-%s", HttpService:UrlEncode(LocalizationService.RobloxLocaleId), HttpService:UrlEncode(Input))
end