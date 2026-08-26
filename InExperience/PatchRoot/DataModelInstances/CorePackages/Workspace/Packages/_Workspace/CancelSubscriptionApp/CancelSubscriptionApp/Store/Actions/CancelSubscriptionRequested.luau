return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionRequested", function(p1)
	return { subscriptionId = p1 }
end)