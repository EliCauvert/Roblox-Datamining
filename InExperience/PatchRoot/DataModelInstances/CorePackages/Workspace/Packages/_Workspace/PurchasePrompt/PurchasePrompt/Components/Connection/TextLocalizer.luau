local roact = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Roact
local localizationContextConsumerModule = require(script.Parent.LocalizationContextConsumer)

return function(p1)
	-- upvalues: roact (ref), localizationContextConsumerModule (ref)
	local locKey = p1.locKey
	local params = p1.params
	local render = p1.render
	assert(typeof(locKey) == "string", "String prop 'locKey' must be provided")
	assert(typeof(render) == "function", "Render prop must be a function")
	
	return roact.createElement(localizationContextConsumerModule, {
		render = function(p2)
			-- upvalues: render (ref), locKey (ref), params (ref)
			return render(p2:Format(locKey, params))
		end
	})
end