local LocalizationService = game:GetService("LocalizationService")

return function(Text: string, p1)
	-- upvalues: LocalizationService (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	
	return Text:gsub("{date}", p1:FormatLocalTime(if DateTime.now():ToLocalTime().Year < p1:ToLocalTime().Year then "ll" else "ddd, MMM DD", RobloxLocaleId)):gsub("{time}", p1:FormatLocalTime("LT", RobloxLocaleId))
end