local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("PurchasePrompt").Parent
local roact = require(parent.PurchasePromptDeps).Roact
local localizationContextProviderModule = require(script.Parent.LocalizationContextProvider)
local localization = require(parent.RobloxAppLocales).Localization

return function(p1)
	-- upvalues: localization (ref), localizationService (ref), roact (ref), localizationContextProviderModule (ref)
	return roact.createElement(localizationContextProviderModule, {
		localizationContext = localization.new(localizationService.RobloxLocaleId)
	}, { PurchasePromptApp = p1() })
end