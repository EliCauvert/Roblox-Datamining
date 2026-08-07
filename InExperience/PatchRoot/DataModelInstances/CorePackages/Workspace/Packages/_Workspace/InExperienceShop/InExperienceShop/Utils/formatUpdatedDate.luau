local localizationService = game:GetService("LocalizationService")

return function(p0) --[[ line: 12 | named "formatUpdatedDate" ]]
	-- upvalues: localizationService (ref)
	if p0 == nil or p0 == "" then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p0)
	
	return if dateTime == nil then p0 else dateTime:FormatLocalTime("ll", localizationService.RobloxLocaleId)
end