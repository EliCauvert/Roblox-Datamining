local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local _ = require(CancelSubscriptionApp.Enums.ErrorStateEnum)

return require(CancelSubscriptionApp.Parent.Rodux).makeActionCreator("CancelSubscriptionFailed", function(ErrorState, SubscriptionId)
	return { errorState = ErrorState, subscriptionId = SubscriptionId }
end)