local roact = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Roact
local localizationContextConsumerModule = require(script.Parent.LocalizationContextConsumer)

return function(p0)
	-- upvalues: roact (ref), localizationContextConsumerModule (ref)
	local locKey = p0.locKey
	local params = p0.params
	local render = p0.render
	assert(typeof(locKey) == "string", "String prop 'locKey' must be provided")
	assert(typeof(render) == "function", "Render prop must be a function")
	
	return roact.createElement(localizationContextConsumerModule, {
		render = function(p1)
			-- upvalues: render (ref), locKey (ref), params (ref)
			return render(p1:Format(locKey, params))
		end
	})
end