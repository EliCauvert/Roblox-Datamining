local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("AdPlayer").Parent
local reactModule = require(parent.React)
local foundationProvider = require(parent.Foundation).FoundationProvider
local localizationProvider = require(parent.Localization).LocalizationProvider
local var1 = require(parent.InExperienceLocales).Localization.new(localizationService.RobloxLocaleId)

return function(p1)
	-- upvalues: reactModule (ref), localizationProvider (ref), var1 (ref), foundationProvider (ref)
	return reactModule.createElement(localizationProvider, { localization = var1 }, {
		foundationProvider = reactModule.createElement(foundationProvider, {}, p1.children)
	})
end