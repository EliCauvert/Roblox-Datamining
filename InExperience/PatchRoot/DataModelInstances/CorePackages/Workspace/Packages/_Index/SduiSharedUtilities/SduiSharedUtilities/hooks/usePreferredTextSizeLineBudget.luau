local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local TextSizeModule = require(Parent.TextSize)
local GetPreferredTextSizeLineBudgetModule = require(SduiSharedUtilities.getPreferredTextSizeLineBudget)

return function(p1) --[[ Line: 15 | Named "usePreferredTextSizeLineBudget" ]]
	-- upvalues: ReactModule (copy), TextSizeModule (copy), GetPreferredTextSizeLineBudgetModule (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2) --[[ Line: 16 ]]
		-- upvalues: TextSizeModule (upval), GetPreferredTextSizeLineBudgetModule (upval), p1 (copy)
		return GetPreferredTextSizeLineBudgetModule(TextSizeModule.getTextSizeStore(p2).getTextSizeOffset(p2), p1)
	end, { p1 })))
end