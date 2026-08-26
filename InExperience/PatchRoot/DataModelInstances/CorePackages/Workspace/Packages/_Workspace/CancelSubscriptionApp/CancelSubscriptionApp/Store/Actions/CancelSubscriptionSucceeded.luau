return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionSucceeded", function(p1)
	return { subscriptionId = p1 }
end)