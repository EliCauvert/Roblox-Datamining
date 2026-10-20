return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionSucceeded", function(SubscriptionId)
	return { subscriptionId = SubscriptionId }
end)