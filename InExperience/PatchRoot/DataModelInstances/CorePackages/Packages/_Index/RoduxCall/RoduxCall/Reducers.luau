local roduxModule = require(script:FindFirstAncestor("RoduxCall").Parent.Rodux)
local currentCallModule = require(script.currentCall)
local suggestedCalleesModule = require(script.suggestedCallees)

return function(p0) --[[ line: 8 ]]
	-- upvalues: roduxModule (ref), currentCallModule (ref), suggestedCalleesModule (ref)
	return roduxModule.combineReducers({
		currentCall = currentCallModule(),
		suggestedCallees = suggestedCalleesModule(p0)
	})
end