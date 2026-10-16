local LocalizationService = game:GetService("LocalizationService")

return function(p1, p2) --[[ Line: 13 | Named "formatTimeoutEndTime" ]]
	-- upvalues: LocalizationService (copy)
	if p1 and p1 ~= "" then
		local Success, Result = pcall(function() --[[ Line: 18 ]]
			-- upvalues: p1 (copy)
			return DateTime.fromIsoDate(p1)
		end)
		
		return if Success and Result then Result:FormatLocalTime(p2 or "M/D, LT", LocalizationService.RobloxLocaleId) else nil
	else
		return nil
	end
end