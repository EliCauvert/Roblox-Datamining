local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local _ = require(cancelSubscriptionApp.Store.Types)
local _ = require(cancelSubscriptionApp.Enums.ErrorStateEnum)

return function(p0) --[[ line: 8 | named "selectErrorState" ]]
	return p0.errorState
end