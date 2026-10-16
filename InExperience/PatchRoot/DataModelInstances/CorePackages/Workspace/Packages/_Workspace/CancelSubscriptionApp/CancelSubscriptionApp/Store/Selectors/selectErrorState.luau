local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local _ = require(CancelSubscriptionApp.Store.Types)
local _ = require(CancelSubscriptionApp.Enums.ErrorStateEnum)

return function(p1) --[[ Line: 8 | Named "selectErrorState" ]]
	return p1.errorState
end