local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local textSizeModule = require(parent.TextSize)
local getPreferredTextSizeLineBudgetModule = require(sduiSharedUtilities.getPreferredTextSizeLineBudget)

return function(p1)
	-- upvalues: reactModule (ref), textSizeModule (ref), getPreferredTextSizeLineBudgetModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: textSizeModule (copy), getPreferredTextSizeLineBudgetModule (copy), p1 (ref)
		return getPreferredTextSizeLineBudgetModule(textSizeModule.getTextSizeStore(p2).getTextSizeOffset(p2), p1)
	end, { p1 }))
end