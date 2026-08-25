return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionSucceeded", function(p0)
	return { subscriptionId = p0 }
end)