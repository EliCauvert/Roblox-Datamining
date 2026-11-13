local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local Rodux = require(Parent.PurchasePromptDeps).Rodux
local SetProductPayloadModule = require(PurchasePrompt.Actions.SetProductPayload)
local CompleteRequestModule = require(PurchasePrompt.Actions.CompleteRequest)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagPromptPurchaseClearStateOnCompletionModule = require(PurchasePrompt.Flags.FFlagPromptPurchaseClearStateOnCompletion)
local t = {}

return (Rodux.createReducer(t, {
	[SetProductPayloadModule.name] = function(_, p1)
		return p1.productPayload
	end,
	[CompleteRequestModule.name] = function(p1, _)
		-- upvalues: FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), t (copy), FFlagPromptPurchaseClearStateOnCompletionModule (copy)
		return if FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.kind == "DeveloperSubscription" then t elseif FFlagPromptPurchaseClearStateOnCompletionModule then t else p1
	end
}))