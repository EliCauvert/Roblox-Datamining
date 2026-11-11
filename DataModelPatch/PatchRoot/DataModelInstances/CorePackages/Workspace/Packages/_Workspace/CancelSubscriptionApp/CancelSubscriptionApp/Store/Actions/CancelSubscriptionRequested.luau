return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionRequested", function(SubscriptionId)
	return { subscriptionId = SubscriptionId }
end)