local Localization = require(script.Parent.Parent.InExperienceLocales).Localization
local NewLocalization = Localization.new(game:GetService("LocalizationService").RobloxLocaleId)

return {
	FormatByKey = function(_, p1, p2) --[[ Line: 14 ]]
		-- upvalues: NewLocalization (copy)
		return NewLocalization:Format(p1, p2)
	end,
	FormatByKeyForLocale = function(_, p1, p2, p3) --[[ Line: 18 ]]
		-- upvalues: Localization (copy)
		return Localization.new(p2):Format(p1, p3)
	end
}