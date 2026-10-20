local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local _ = require(CancelSubscriptionApp.Store.Types)
local _ = require(CancelSubscriptionApp.Enums.ErrorStateEnum)

return function(p1)
	return p1.errorState
end