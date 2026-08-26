return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionStarted", function(p1, p2)
	return { subscriptionId = p1, expirationDate = p2 }
end)