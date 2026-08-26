local localization = require(script.Parent.Parent.InExperienceLocales).Localization
local var1 = localization.new(game:GetService("LocalizationService").RobloxLocaleId)

return {
	FormatByKey = function(_, p1, p2)
		-- upvalues: var1 (ref)
		return var1:Format(p1, p2)
	end,
	FormatByKeyForLocale = function(_, p1, p2, p3)
		-- upvalues: localization (ref)
		return localization.new(p2):Format(p1, p3)
	end
}