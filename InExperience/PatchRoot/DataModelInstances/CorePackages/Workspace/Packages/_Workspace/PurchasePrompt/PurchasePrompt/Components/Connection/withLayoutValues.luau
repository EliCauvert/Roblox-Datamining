local roact = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Roact
local layoutValuesContextModule = require(script.Parent.LayoutValuesContext)

return function(p1)
	-- upvalues: roact (ref), layoutValuesContextModule (ref)
	assert(type(p1) == "function", "Expect withLayoutValues callback to be a function.")
	
	return roact.createElement(layoutValuesContextModule.Consumer, { render = p1 })
end