local parent = script.Parent.Parent
local setPromptStateModule = require(parent.Actions.SetPromptState)
local errorOccurredModule = require(parent.Actions.ErrorOccurred)
local subscriptionPurchaseInfoReceivedModule = require(parent.Actions.SubscriptionPurchaseInfoReceived)
local promptStateModule = require(parent.Enums.PromptState)
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local thunkModule = require(parent.Thunk)

return function(p1)
	-- upvalues: thunkModule (ref), subscriptionPurchaseInfoReceivedModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, nil, function(p2, _)
		-- upvalues: subscriptionPurchaseInfoReceivedModule (copy), p1 (ref), errorOccurredModule (copy), purchaseErrorModule (copy), setPromptStateModule (copy), promptStateModule (copy)
		p2:dispatch(subscriptionPurchaseInfoReceivedModule(p1))
		
		return if p1.CanPurchase == false then p2:dispatch(errorOccurredModule(purchaseErrorModule.AlreadySubscribed)) else p2:dispatch(setPromptStateModule(promptStateModule.PromptSubscriptionPurchase))
	end)
end