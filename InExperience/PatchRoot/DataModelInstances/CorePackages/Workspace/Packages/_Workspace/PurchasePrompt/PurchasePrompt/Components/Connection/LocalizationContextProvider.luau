local roact = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Roact
local localizationContextModule = require(script.Parent.LocalizationContext)

return function(p0)
	-- upvalues: roact (ref), localizationContextModule (ref)
	return roact.createElement(localizationContextModule.Provider, { value = p0.localizationContext }, roact.oneChild(p0[roact.Children]))
end