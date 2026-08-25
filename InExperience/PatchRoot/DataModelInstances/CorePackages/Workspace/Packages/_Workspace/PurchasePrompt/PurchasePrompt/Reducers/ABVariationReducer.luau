local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local purchasePromptDepsModule = require(purchasePrompt.Parent.PurchasePromptDeps)
local cryo = purchasePromptDepsModule.Cryo

return purchasePromptDepsModule.Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.SetABVariation).name] = function(p0, p1)
		-- upvalues: cryo (ref)
		assert(type(p1.key) == "string", "Expected 'key' to be a string")
		assert(type(p1.variation) == "string", "Expected 'variation' to be a string")
		
		return cryo.Dictionary.join(p0, { [p1.key] = p1.variation })
	end
})