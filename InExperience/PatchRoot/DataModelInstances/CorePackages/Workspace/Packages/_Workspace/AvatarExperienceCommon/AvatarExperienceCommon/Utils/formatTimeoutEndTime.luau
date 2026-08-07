local localizationService = game:GetService("LocalizationService")

return function(p0, p1) --[[ line: 13 | named "formatTimeoutEndTime" ]]
	-- upvalues: localizationService (ref)
	if not p0 or p0 == "" then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 18 ]]
		-- upvalues: p0 (ref)
		return DateTime.fromIsoDate(p0)
	end)
	
	return if ok and status then status:FormatLocalTime(p1 or "M/D, LT", localizationService.RobloxLocaleId) else nil
end