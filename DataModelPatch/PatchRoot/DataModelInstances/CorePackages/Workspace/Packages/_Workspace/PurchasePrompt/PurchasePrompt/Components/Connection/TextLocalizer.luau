local Roact = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Roact
local LocalizationContextConsumerModule = require(script.Parent.LocalizationContextConsumer)

return function(p1)
	-- upvalues: Roact (copy), LocalizationContextConsumerModule (copy)
	local LocKey = p1.locKey
	local Params = p1.params
	local RenderFunction = p1.render
	assert(typeof(LocKey) == "string", "String prop 'locKey' must be provided")
	assert(typeof(RenderFunction) == "function", "Render prop must be a function")
	
	return Roact.createElement(LocalizationContextConsumerModule, {
		render = function(p2)
			-- upvalues: RenderFunction (copy), LocKey (copy), Params (copy)
			return RenderFunction(p2:Format(LocKey, Params))
		end
	})
end