local Parent = script.Parent.Parent
local SetPromptStateModule = require(Parent.Actions.SetPromptState)
local ErrorOccurredModule = require(Parent.Actions.ErrorOccurred)
local SubscriptionPurchaseInfoReceivedModule = require(Parent.Actions.SubscriptionPurchaseInfoReceived)
local PromptStateModule = require(Parent.Enums.PromptState)
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local ThunkModule = require(Parent.Thunk)

return function(p1) --[[ Line: 13 | Named "resolveSubscriptionPromptState" ]]
	-- upvalues: ThunkModule (copy), SubscriptionPurchaseInfoReceivedModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), SetPromptStateModule (copy), PromptStateModule (copy)
	return ThunkModule.new(script.Name, nil, function(p2, _) --[[ Line: 14 ]]
		-- upvalues: SubscriptionPurchaseInfoReceivedModule (upval), p1 (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval), SetPromptStateModule (upval), PromptStateModule (upval)
		p2:dispatch(SubscriptionPurchaseInfoReceivedModule(p1))
		
		return if p1.CanPurchase == false then p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.AlreadySubscribed)) else p2:dispatch(SetPromptStateModule(PromptStateModule.PromptSubscriptionPurchase))
	end)
end