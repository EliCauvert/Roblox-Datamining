local parent = script.Parent.Parent
local setPromptStateModule = require(parent.Actions.SetPromptState)
local errorOccurredModule = require(parent.Actions.ErrorOccurred)
local subscriptionPurchaseInfoReceivedModule = require(parent.Actions.SubscriptionPurchaseInfoReceived)
local promptStateModule = require(parent.Enums.PromptState)
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local thunkModule = require(parent.Thunk)

return function(p0)
	-- upvalues: thunkModule (ref), subscriptionPurchaseInfoReceivedModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, nil, function(p1, _)
		-- upvalues: subscriptionPurchaseInfoReceivedModule (copy), p0 (ref), errorOccurredModule (copy), purchaseErrorModule (copy), setPromptStateModule (copy), promptStateModule (copy)
		p1:dispatch(subscriptionPurchaseInfoReceivedModule(p0))
		
		return if p0.CanPurchase == false then p1:dispatch(errorOccurredModule(purchaseErrorModule.AlreadySubscribed)) else p1:dispatch(setPromptStateModule(promptStateModule.PromptSubscriptionPurchase))
	end)
end