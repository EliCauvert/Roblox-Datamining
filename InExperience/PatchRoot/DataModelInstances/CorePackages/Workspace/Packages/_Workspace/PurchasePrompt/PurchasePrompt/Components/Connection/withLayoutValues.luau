local roact = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Roact
local layoutValuesContextModule = require(script.Parent.LayoutValuesContext)

return function(p0)
	-- upvalues: roact (ref), layoutValuesContextModule (ref)
	assert(type(p0) == "function", "Expect withLayoutValues callback to be a function.")
	
	return roact.createElement(layoutValuesContextModule.Consumer, { render = p0 })
end