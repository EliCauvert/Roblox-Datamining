local localizationService = game:GetService("LocalizationService")

return function(p1, p2)
	-- upvalues: localizationService (ref)
	if not p1 or p1 == "" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return DateTime.fromIsoDate(p1)
	end)
	
	return if ok and status then status:FormatLocalTime(p2 or "M/D, LT", localizationService.RobloxLocaleId) else nil
end