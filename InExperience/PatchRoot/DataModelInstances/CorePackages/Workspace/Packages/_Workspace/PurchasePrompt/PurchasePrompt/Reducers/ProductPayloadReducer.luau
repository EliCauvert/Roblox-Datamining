local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local rodux = require(parent.PurchasePromptDeps).Rodux
local setProductPayloadModule = require(purchasePrompt.Actions.SetProductPayload)
local completeRequestModule = require(purchasePrompt.Actions.CompleteRequest)
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagPromptPurchaseClearStateOnCompletionModule = require(purchasePrompt.Flags.FFlagPromptPurchaseClearStateOnCompletion)
local t = {}

return rodux.createReducer(t, {
	[setProductPayloadModule.name] = function(_, p1)
		return p1.productPayload
	end,
	[completeRequestModule.name] = function(p1, _)
		-- upvalues: fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), t (ref), fFlagPromptPurchaseClearStateOnCompletionModule (ref)
		return if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.kind == "DeveloperSubscription" then t elseif fFlagPromptPurchaseClearStateOnCompletionModule then t else p1
	end
})