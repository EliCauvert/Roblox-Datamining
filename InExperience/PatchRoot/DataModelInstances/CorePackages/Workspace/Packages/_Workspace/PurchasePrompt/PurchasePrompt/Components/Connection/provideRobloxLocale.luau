local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("PurchasePrompt").Parent
local Roact = require(Parent.PurchasePromptDeps).Roact
local LocalizationContextProviderModule = require(script.Parent.LocalizationContextProvider)
local Localization = require(Parent.RobloxAppLocales).Localization

return function(Callback) --[[ Line: 17 ]]
	-- upvalues: Localization (copy), LocalizationService (copy), Roact (copy), LocalizationContextProviderModule (copy)
	return Roact.createElement(LocalizationContextProviderModule, {
		localizationContext = Localization.new(LocalizationService.RobloxLocaleId)
	}, { PurchasePromptApp = Callback() })
end