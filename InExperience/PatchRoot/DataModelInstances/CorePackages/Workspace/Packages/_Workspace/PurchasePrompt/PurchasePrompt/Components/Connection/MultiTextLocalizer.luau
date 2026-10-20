local PurchasePromptDepsModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps)
local Roact = PurchasePromptDepsModule.Roact
local T = PurchasePromptDepsModule.t
local LocalizationContextConsumerModule = require(script.Parent.LocalizationContextConsumer)
local StrictInterfaceResult = T.strictInterface({ locKeys = T.table, render = T.callback })
local StrictInterfaceResult1 = T.strictInterface({ key = T.string, params = T.optional(T.table) })

return function(p1)
	-- upvalues: StrictInterfaceResult (copy), StrictInterfaceResult1 (copy), Roact (copy), LocalizationContextConsumerModule (copy)
	assert(StrictInterfaceResult(p1))
	
	for _, locKey in pairs(p1.locKeys) do
		assert(StrictInterfaceResult1(locKey))
	end
	local RenderFunction = p1.render
	
	return Roact.createElement(LocalizationContextConsumerModule, {
		render = function(p2)
			-- upvalues: p1 (copy), RenderFunction (copy)
			local FormatResults = {}
			
			for i, locKey in pairs(p1.locKeys) do
				FormatResults[i] = p2:Format(locKey.key, locKey.params)
			end
			return RenderFunction(FormatResults)
		end
	})
end