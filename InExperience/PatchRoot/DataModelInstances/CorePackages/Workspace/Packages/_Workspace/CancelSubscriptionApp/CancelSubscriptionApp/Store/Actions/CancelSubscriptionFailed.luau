local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local _ = require(cancelSubscriptionApp.Enums.ErrorStateEnum)

return require(cancelSubscriptionApp.Parent.Rodux).makeActionCreator("CancelSubscriptionFailed", function(p1, p2)
	return { errorState = p1, subscriptionId = p2 }
end)