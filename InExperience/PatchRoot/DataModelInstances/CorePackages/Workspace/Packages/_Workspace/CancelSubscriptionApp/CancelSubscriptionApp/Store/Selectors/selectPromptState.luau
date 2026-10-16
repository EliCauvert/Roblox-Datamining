local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local _ = require(CancelSubscriptionApp.Store.Types)
local _ = require(CancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)

return function(p1) --[[ Line: 8 | Named "selectPromptState" ]]
	return p1.promptState
end