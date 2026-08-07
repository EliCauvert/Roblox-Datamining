return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionStarted", function(p0, p1) --[[ line: 11 ]]
	return { subscriptionId = p0, expirationDate = p1 }
end)