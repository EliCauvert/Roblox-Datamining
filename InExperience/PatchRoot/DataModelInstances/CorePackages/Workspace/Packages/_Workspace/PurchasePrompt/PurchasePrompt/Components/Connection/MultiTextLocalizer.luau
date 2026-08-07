local purchasePromptDepsModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps)
local roact = purchasePromptDepsModule.Roact
local t = purchasePromptDepsModule.t
local localizationContextConsumerModule = require(script.Parent.LocalizationContextConsumer)
local var2 = t.strictInterface({ locKeys = t.table, render = t.callback })
local var3 = t.strictInterface({ key = t.string, params = t.optional(t.table) })

return function(p0) --[[ line: 20 | named "MultiTextLocalizer" ]]
	-- upvalues: var2 (ref), var3 (ref), roact (ref), localizationContextConsumerModule (ref)
	assert(var2(p0))
	
	for i, v in pairs(p0.locKeys) do
		assert(var3(v))
	end
	local render = p0.render
	
	return roact.createElement(localizationContextConsumerModule, {
		render = function(p1) --[[ line: 29 ]]
			-- upvalues: p0 (ref), render (ref)
			local t = {}
			
			for i, v in pairs(p0.locKeys) do
				t[i] = p1:Format(v.key, v.params)
			end
			return render(t)
		end
	})
end