local Roact = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Roact
local LayoutValuesContextModule = require(script.Parent.LayoutValuesContext)

return function(Callback) --[[ Line: 12 ]]
	-- upvalues: Roact (copy), LayoutValuesContextModule (copy)
	assert(type(Callback) == "function", "Expect withLayoutValues callback to be a function.")
	
	return Roact.createElement(LayoutValuesContextModule.Consumer, { render = Callback })
end