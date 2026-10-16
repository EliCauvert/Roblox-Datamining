local Roact = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Roact
local LocalizationContextModule = require(script.Parent.LocalizationContext)

return function(p1) --[[ Line: 13 ]]
	-- upvalues: Roact (copy), LocalizationContextModule (copy)
	return Roact.createElement(LocalizationContextModule.Provider, { value = p1.localizationContext }, Roact.oneChild(p1[Roact.Children]))
end