local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("AdPlayer").Parent
local reactModule = require(parent.React)
local foundationProvider = require(parent.Foundation).FoundationProvider
local localizationProvider = require(parent.Localization).LocalizationProvider
local var2 = require(parent.InExperienceLocales).Localization.new(localizationService.RobloxLocaleId)

return function(p0) --[[ line: 14 ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), var2 (ref), foundationProvider (ref)
	return reactModule.createElement(localizationProvider, { localization = var2 }, {
		foundationProvider = reactModule.createElement(foundationProvider, {}, p0.children)
	})
end