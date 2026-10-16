return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionStarted", function(SubscriptionId, ExpirationDate) --[[ Line: 11 ]]
	return {
		subscriptionId = SubscriptionId,
		expirationDate = ExpirationDate
	}
end)