return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionStarted", function(SubscriptionId, ExpirationDate)
	return {
		subscriptionId = SubscriptionId,
		expirationDate = ExpirationDate
	}
end)