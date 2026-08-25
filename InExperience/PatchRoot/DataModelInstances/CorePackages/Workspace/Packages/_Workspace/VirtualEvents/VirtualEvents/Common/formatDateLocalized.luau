local localizationService = game:GetService("LocalizationService")

return function(p0, p1)
	-- upvalues: localizationService (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	
	return p0:gsub("{date}", p1:FormatLocalTime(if DateTime.now():ToLocalTime().Year < p1:ToLocalTime().Year then "ll" else "ddd, MMM DD", robloxLocaleId)):gsub("{time}", p1:FormatLocalTime("LT", robloxLocaleId))
end