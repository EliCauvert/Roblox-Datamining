local localization = require(script.Parent.Parent.InExperienceLocales).Localization
local var0 = localization.new(game:GetService("LocalizationService").RobloxLocaleId)

return {
	FormatByKey = function(_, p0, p1) --[[ line: 14 ]]
		-- upvalues: var0 (ref)
		return var0:Format(p0, p1)
	end,
	FormatByKeyForLocale = function(_, p2, p3, p4) --[[ line: 18 ]]
		-- upvalues: localization (ref)
		return localization.new(p3):Format(p2, p4)
	end
}