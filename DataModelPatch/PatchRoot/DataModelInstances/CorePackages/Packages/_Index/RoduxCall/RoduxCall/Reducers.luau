local RoduxModule = require(script:FindFirstAncestor("RoduxCall").Parent.Rodux)
local CurrentCallModule = require(script.currentCall)
local SuggestedCalleesModule = require(script.suggestedCallees)

return function(p1)
	-- upvalues: RoduxModule (copy), CurrentCallModule (copy), SuggestedCalleesModule (copy)
	return RoduxModule.combineReducers({
		currentCall = CurrentCallModule(),
		suggestedCallees = SuggestedCalleesModule(p1)
	})
end