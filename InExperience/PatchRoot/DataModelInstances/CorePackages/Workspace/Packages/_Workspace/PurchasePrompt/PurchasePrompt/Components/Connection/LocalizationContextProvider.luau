local roact = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Roact
local localizationContextModule = require(script.Parent.LocalizationContext)

return function(p1)
	-- upvalues: roact (ref), localizationContextModule (ref)
	return roact.createElement(localizationContextModule.Provider, { value = p1.localizationContext }, roact.oneChild(p1[roact.Children]))
end