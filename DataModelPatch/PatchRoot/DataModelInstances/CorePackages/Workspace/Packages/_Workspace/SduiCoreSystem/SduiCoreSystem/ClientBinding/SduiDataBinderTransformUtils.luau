local LocalizationService = game:GetService("LocalizationService")

return {
	snakeToCamel = function(Text: string): string
		return Text:gsub("_(%l)", function(Text: string): string
			return Text:upper()
		end)
	end,
	protobufTimestampToLocalTimeString = function(p1)
		-- upvalues: LocalizationService (copy)
		return if p1 == nil then nil elseif p1.seconds then DateTime.fromUnixTimestamp(p1.seconds):FormatLocalTime("ll", LocalizationService.RobloxLocaleId) else tostring(p1)
	end
}