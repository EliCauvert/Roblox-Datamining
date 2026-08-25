return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionRequested", function(p0)
	return { subscriptionId = p0 }
end)