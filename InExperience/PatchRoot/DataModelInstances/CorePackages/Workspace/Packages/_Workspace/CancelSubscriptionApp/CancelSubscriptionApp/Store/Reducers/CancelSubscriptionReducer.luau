local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local CancelUserSubscriptionAsyncPromptStateEnumModule = require(CancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)
local _ = require(CancelSubscriptionApp.Store.Types)

local function _()
	-- upvalues: CancelUserSubscriptionAsyncPromptStateEnumModule (copy)
	return {
		promptState = CancelUserSubscriptionAsyncPromptStateEnumModule.None
	}
end

return (require(CancelSubscriptionApp.Parent.Rodux).createReducer({
	promptState = CancelUserSubscriptionAsyncPromptStateEnumModule.None
}, {
	[require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionEnded).name] = function(_, _)
		-- upvalues: CancelUserSubscriptionAsyncPromptStateEnumModule (copy)
		return {
			promptState = CancelUserSubscriptionAsyncPromptStateEnumModule.None
		}
	end,
	[require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionSucceeded).name] = function(Tbl, p1)
		-- upvalues: CancelUserSubscriptionAsyncPromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.subscriptionId = p1.subscriptionId
		Copy.promptState = CancelUserSubscriptionAsyncPromptStateEnumModule.Success
		
		return Copy
	end,
	[require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionFailed).name] = function(Tbl, p1)
		-- upvalues: CancelUserSubscriptionAsyncPromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.errorState = p1.errorState
		Copy.subscriptionId = p1.subscriptionId
		Copy.promptState = CancelUserSubscriptionAsyncPromptStateEnumModule.Error
		
		return Copy
	end,
	[require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionRequested).name] = function(Tbl, p1)
		-- upvalues: CancelUserSubscriptionAsyncPromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.subscriptionId = p1.subscriptionId
		Copy.promptState = CancelUserSubscriptionAsyncPromptStateEnumModule.Pending
		
		return Copy
	end,
	[require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionStarted).name] = function(Tbl, p1)
		-- upvalues: CancelUserSubscriptionAsyncPromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.promptState = CancelUserSubscriptionAsyncPromptStateEnumModule.Request
		Copy.subscriptionId = p1.subscriptionId
		Copy.expirationDate = p1.expirationDate
		
		return Copy
	end
}))