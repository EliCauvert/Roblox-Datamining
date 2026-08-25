return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionStarted", function(p0, p1)
	return { subscriptionId = p0, expirationDate = p1 }
end)