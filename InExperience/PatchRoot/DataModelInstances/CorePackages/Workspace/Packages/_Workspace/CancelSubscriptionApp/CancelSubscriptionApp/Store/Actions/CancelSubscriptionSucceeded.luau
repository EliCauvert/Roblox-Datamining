return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionSucceeded", function(SubscriptionId) --[[ Line: 10 ]]
	return { subscriptionId = SubscriptionId }
end)