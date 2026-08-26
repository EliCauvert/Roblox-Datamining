local localizationService = game:GetService("LocalizationService")

return {
	snakeToCamel = function(p1)
		return p1:gsub("_(%l)", function(p2)
			return p2:upper()
		end)
	end,
	protobufTimestampToLocalTimeString = function(p1)
		-- upvalues: localizationService (ref)
		return if p1 == nil then nil elseif p1.seconds then DateTime.fromUnixTimestamp(p1.seconds):FormatLocalTime("ll", localizationService.RobloxLocaleId) else tostring(p1)
	end
}