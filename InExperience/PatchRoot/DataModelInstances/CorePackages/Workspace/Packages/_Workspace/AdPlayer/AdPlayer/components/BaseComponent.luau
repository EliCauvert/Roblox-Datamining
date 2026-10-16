local Parent = script:FindFirstAncestor("AdPlayer").Parent
local ReactModule = require(Parent.React)
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local NewResult = require(Parent.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), NewResult (copy), FoundationProvider (copy)
	return ReactModule.createElement(LocalizationProvider, { localization = NewResult }, {
		foundationProvider = ReactModule.createElement(FoundationProvider, {}, p1.children)
	})
end