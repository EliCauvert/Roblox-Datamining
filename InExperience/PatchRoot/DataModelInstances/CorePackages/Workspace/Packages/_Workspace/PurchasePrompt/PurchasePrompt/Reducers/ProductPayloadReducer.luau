local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagPromptPurchaseClearStateOnCompletionModule = require(PurchasePrompt.Flags.FFlagPromptPurchaseClearStateOnCompletion)
local t = {}

return (require(Parent.PurchasePromptDeps).Rodux.createReducer(t, {
	[require(PurchasePrompt.Actions.SetProductPayload).name] = function(_, p1) --[[ Line: 15 ]]
		return p1.productPayload
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(p1, _) --[[ Line: 18 ]]
		-- upvalues: FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), t (copy), FFlagPromptPurchaseClearStateOnCompletionModule (copy)
		return if FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.kind == "DeveloperSubscription" then t elseif FFlagPromptPurchaseClearStateOnCompletionModule then t else p1
	end
}))