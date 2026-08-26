local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local _ = require(cancelSubscriptionApp.Store.Types)
local _ = require(cancelSubscriptionApp.Enums.ErrorStateEnum)

return function(p1)
	return p1.errorState
end