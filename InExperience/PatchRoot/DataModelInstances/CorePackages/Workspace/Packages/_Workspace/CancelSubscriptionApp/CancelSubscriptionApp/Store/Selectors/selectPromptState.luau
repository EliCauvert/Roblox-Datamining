local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local _ = require(cancelSubscriptionApp.Store.Types)
local _ = require(cancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)

return function(p0)
	return p0.promptState
end