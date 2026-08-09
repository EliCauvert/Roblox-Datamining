local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local rodux = require(parent.PurchasePromptDeps).Rodux
local setProductPayloadModule = require(purchasePrompt.Actions.SetProductPayload)
local completeRequestModule = require(purchasePrompt.Actions.CompleteRequest)
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local t = {}

return rodux.createReducer(t, {
	[setProductPayloadModule.name] = function(_, p0) --[[ line: 14 ]]
		return p0.productPayload
	end,
	[completeRequestModule.name] = function(p1, _) --[[ line: 17 ]]
		-- upvalues: fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), t (ref)
		return if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.kind == "DeveloperSubscription" then t else p1
	end
})