local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local roduxModule = require(cancelSubscriptionApp.Parent.Rodux)
local cancelUserSubscriptionAsyncPromptStateEnumModule = require(cancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)
local cancelSubscriptionEndedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionEnded)
local cancelSubscriptionSucceededModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionSucceeded)
local cancelSubscriptionFailedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionFailed)
local cancelSubscriptionStartedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionStarted)
local cancelSubscriptionRequestedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionRequested)
local _ = require(cancelSubscriptionApp.Store.Types)

local function _() --[[ line: 22 | named "createInitialState" ]]
	-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
	return {
		promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.None
	}
end

return roduxModule.createReducer({
	promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.None
}, {
	[cancelSubscriptionEndedModule.name] = function(_, _) --[[ line: 29 ]]
		-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
		return {
			promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.None
		}
	end,
	[cancelSubscriptionSucceededModule.name] = function(p0, p1) --[[ line: 35 ]]
		-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
		local cloned = table.clone(p0)
		cloned.subscriptionId = p1.subscriptionId
		cloned.promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.Success
		
		return cloned
	end,
	[cancelSubscriptionFailedModule.name] = function(p2, p3) --[[ line: 44 ]]
		-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
		local cloned = table.clone(p2)
		cloned.errorState = p3.errorState
		cloned.subscriptionId = p3.subscriptionId
		cloned.promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.Error
		
		return cloned
	end,
	[cancelSubscriptionRequestedModule.name] = function(p4, p5) --[[ line: 54 ]]
		-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
		local cloned = table.clone(p4)
		cloned.subscriptionId = p5.subscriptionId
		cloned.promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.Pending
		
		return cloned
	end,
	[cancelSubscriptionStartedModule.name] = function(p6, p7) --[[ line: 63 ]]
		-- upvalues: cancelUserSubscriptionAsyncPromptStateEnumModule (ref)
		local cloned = table.clone(p6)
		cloned.promptState = cancelUserSubscriptionAsyncPromptStateEnumModule.Request
		cloned.subscriptionId = p7.subscriptionId
		cloned.expirationDate = p7.expirationDate
		
		return cloned
	end
})