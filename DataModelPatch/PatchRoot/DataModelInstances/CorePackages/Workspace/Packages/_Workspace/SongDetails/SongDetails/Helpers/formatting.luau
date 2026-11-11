local LocalizationService = game:GetService("LocalizationService")

return {
	formatDate = function(p1, p2)
		-- upvalues: LocalizationService (copy)
		local _DateTime = DateTime.fromIsoDate(p1)
		
		return _DateTime and _DateTime:FormatLocalTime(p2 or "ll", LocalizationService.RobloxLocaleId) or ""
	end,
	formatDuration = function(p1: number): string
		if p1 <= 0 then
			return "00:00"
		else
			local Floored = math.floor(p1 / 3600)
			local Formatted = string.format("%02d", Floored)
			local Formatted1 = string.format("%02d", (math.floor(p1 % 3600 / 60)))
			local Formatted2 = string.format("%02d", p1 % 60)
			
			return if Floored > 0 then Formatted .. ":" .. Formatted1 .. ":" .. Formatted2 else Formatted1 .. ":" .. Formatted2
		end
	end
}