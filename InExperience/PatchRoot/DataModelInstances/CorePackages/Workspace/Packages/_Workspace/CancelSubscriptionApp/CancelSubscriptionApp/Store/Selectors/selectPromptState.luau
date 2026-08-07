local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local _ = require(cancelSubscriptionApp.Store.Types)
local _ = require(cancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)

return function(p0) --[[ line: 8 | named "selectPromptState" ]]
	return p0.promptState
end