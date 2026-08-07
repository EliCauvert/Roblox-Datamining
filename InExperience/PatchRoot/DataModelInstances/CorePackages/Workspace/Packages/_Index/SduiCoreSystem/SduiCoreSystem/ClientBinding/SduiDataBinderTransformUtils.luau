local localizationService = game:GetService("LocalizationService")

return {
	snakeToCamel = function(p0) --[[ line: 16 ]]
		return p0:gsub("_(%l)", function(p1) --[[ line: 17 ]]
			return p1:upper()
		end)
	end,
	protobufTimestampToLocalTimeString = function(p2) --[[ line: 25 ]]
		-- upvalues: localizationService (ref)
		return if p2 == nil then nil elseif p2.seconds then DateTime.fromUnixTimestamp(p2.seconds):FormatLocalTime("ll", localizationService.RobloxLocaleId) else tostring(p2)
	end
}