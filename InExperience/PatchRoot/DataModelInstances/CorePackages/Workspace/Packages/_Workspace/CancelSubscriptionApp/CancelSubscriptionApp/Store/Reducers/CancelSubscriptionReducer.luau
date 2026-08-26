local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local roduxModule = require(cancelSubscriptionApp.Parent.Rodux)
local cancelUserSubscriptionAsyncPromptStateEnumModule = require(cancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)
local cancelSubscriptionEndedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionEnded)
local cancelSubscriptionSucceededModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionSucceeded)
local cancelSubscriptionFailedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionFailed)
local cancelSubscriptionStartedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionStarted)
local cancelSubscriptionRequestedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionRequested)
local _ = require(cancelSubscriptionApp.Store.Types)

local function _()
	-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
	return {
		promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.None
	}
end

return roduxModule.createReducer({
	promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.None
}, {
	[cancelSubscriptionEndedModule.name] = function(_, _)
		-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
		return {
			promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.None
		}
	end,
	[cancelSubscriptionSucceededModule.name] = function(p1, p2)
		-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
		local cloned = table.clone(p1)
		cloned.subscriptionId = p2.subscriptionId
		cloned.promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.Success
		
		return cloned
	end,
	[cancelSubscriptionFailedModule.name] = function(p1, p2)
		-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
		local cloned = table.clone(p1)
		cloned.errorState = p2.errorState
		cloned.subscriptionId = p2.subscriptionId
		cloned.promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.Error
		
		return cloned
	end,
	[cancelSubscriptionRequestedModule.name] = function(p1, p2)
		-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
		local cloned = table.clone(p1)
		cloned.subscriptionId = p2.subscriptionId
		cloned.promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.Pending
		
		return cloned
	end,
	[cancelSubscriptionStartedModule.name] = function(p1, p2)
		-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
		local cloned = table.clone(p1)
		cloned.promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.Request
		cloned.subscriptionId = p2.subscriptionId
		cloned.expirationDate = p2.expirationDate
		
		return cloned
	end
})