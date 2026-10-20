local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchasePromptDepsModule = require(PurchasePrompt.Parent.PurchasePromptDeps)
local Cryo = PurchasePromptDepsModule.Cryo

return (PurchasePromptDepsModule.Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.SetABVariation).name] = function(p1, p2)
		-- upvalues: Cryo (copy)
		assert(type(p2.key) == "string", "Expected 'key' to be a string")
		assert(type(p2.variation) == "string", "Expected 'variation' to be a string")
		
		return Cryo.Dictionary.join(p1, { [p2.key] = p2.variation })
	end
}))