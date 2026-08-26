local localizationService = game:GetService("LocalizationService")

return function(p1)
	-- upvalues: localizationService (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p1)
	
	return if dateTime == nil then p1 else dateTime:FormatLocalTime("ll", localizationService.RobloxLocaleId)
end