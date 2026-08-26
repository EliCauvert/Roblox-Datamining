local localizationService = game:GetService("LocalizationService")

return function(p1, p2)
	-- upvalues: localizationService (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	
	return p1:gsub("{date}", p2:FormatLocalTime(if DateTime.now():ToLocalTime().Year < p2:ToLocalTime().Year then "ll" else "ddd, MMM DD", robloxLocaleId)):gsub("{time}", p2:FormatLocalTime("LT", robloxLocaleId))
end