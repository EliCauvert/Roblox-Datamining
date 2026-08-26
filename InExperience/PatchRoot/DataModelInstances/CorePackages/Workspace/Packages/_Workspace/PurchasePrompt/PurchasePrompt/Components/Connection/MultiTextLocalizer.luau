local purchasePromptDepsModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps)
local roact = purchasePromptDepsModule.Roact
local t = purchasePromptDepsModule.t
local localizationContextConsumerModule = require(script.Parent.LocalizationContextConsumer)
local var1 = t.strictInterface({ locKeys = t.table, render = t.callback })
local var2 = t.strictInterface({ key = t.string, params = t.optional(t.table) })

return function(p1)
	-- upvalues: var1 (ref), var2 (ref), roact (ref), localizationContextConsumerModule (ref)
	assert(var1(p1))
	
	for i, v in pairs(p1.locKeys) do
		assert(var2(v))
	end
	local render = p1.render
	
	return roact.createElement(localizationContextConsumerModule, {
		render = function(p2)
			-- upvalues: p1 (ref), render (ref)
			local t = {}
			
			for i, v in pairs(p1.locKeys) do
				t[i] = p2:Format(v.key, v.params)
			end
			return render(t)
		end
	})
end