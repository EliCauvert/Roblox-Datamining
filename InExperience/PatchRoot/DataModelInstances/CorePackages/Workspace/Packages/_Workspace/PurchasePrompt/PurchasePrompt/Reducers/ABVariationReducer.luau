local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local purchasePromptDepsModule = require(purchasePrompt.Parent.PurchasePromptDeps)
local cryo = purchasePromptDepsModule.Cryo

return purchasePromptDepsModule.Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.SetABVariation).name] = function(p1, p2)
		-- upvalues: cryo (ref)
		assert(type(p2.key) == "string", "Expected 'key' to be a string")
		assert(type(p2.variation) == "string", "Expected 'variation' to be a string")
		
		return cryo.Dictionary.join(p1, { [p2.key] = p2.variation })
	end
})