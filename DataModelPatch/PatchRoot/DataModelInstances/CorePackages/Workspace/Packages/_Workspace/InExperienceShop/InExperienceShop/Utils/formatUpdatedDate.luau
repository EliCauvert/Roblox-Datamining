local LocalizationService = game:GetService("LocalizationService")

return function(p1)
	-- upvalues: LocalizationService (copy)
	if p1 == nil or p1 == "" then
		return nil
	else
		local _DateTime = DateTime.fromIsoDate(p1)
		
		return if _DateTime == nil then p1 else _DateTime:FormatLocalTime("ll", LocalizationService.RobloxLocaleId)
	end
end