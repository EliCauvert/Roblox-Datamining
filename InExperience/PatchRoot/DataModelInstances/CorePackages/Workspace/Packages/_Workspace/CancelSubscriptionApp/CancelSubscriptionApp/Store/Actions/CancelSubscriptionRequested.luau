return require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Rodux).makeActionCreator("CancelSubscriptionRequested", function(SubscriptionId) --[[ Line: 10 ]]
	return { subscriptionId = SubscriptionId }
end)