local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local roact = require(purchasePrompt.Parent.PurchasePromptDeps).Roact
local layoutValuesModule = require(purchasePrompt.Services.LayoutValues)
local layoutValuesContextModule = require(script.Parent.LayoutValuesContext)

return function(p1)
	-- upvalues: layoutValuesModule (ref), roact (ref), layoutValuesContextModule (ref)
	return roact.createElement(layoutValuesContextModule.Provider, {
		value = layoutValuesModule.new(p1.isTenFootInterface).layout
	}, roact.oneChild(p1[roact.Children]))
end