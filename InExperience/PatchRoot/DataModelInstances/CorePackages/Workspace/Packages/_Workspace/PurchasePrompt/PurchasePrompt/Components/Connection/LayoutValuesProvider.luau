local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local roact = require(purchasePrompt.Parent.PurchasePromptDeps).Roact
local layoutValuesModule = require(purchasePrompt.Services.LayoutValues)
local layoutValuesContextModule = require(script.Parent.LayoutValuesContext)

return function(p0)
	-- upvalues: layoutValuesModule (ref), roact (ref), layoutValuesContextModule (ref)
	return roact.createElement(layoutValuesContextModule.Provider, {
		value = layoutValuesModule.new(p0.isTenFootInterface).layout
	}, roact.oneChild(p0[roact.Children]))
end