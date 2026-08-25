local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local _ = require(cancelSubscriptionApp.Enums.ErrorStateEnum)

return require(cancelSubscriptionApp.Parent.Rodux).makeActionCreator("CancelSubscriptionFailed", function(p0, p1)
	return { errorState = p0, subscriptionId = p1 }
end)