local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return function() --[[ line: 13 | named "createPublishGameSheetStore" ]]
	-- upvalues: signalsModule (ref), signalsReactModule (ref)
	local var2, var3 = signalsModule.createSignal(false)
	
	return {
		getIsOpen = var2,
		useIsOpen = function() --[[ line: 16 ]]
			-- upvalues: signalsReactModule (copy), var2 (ref)
			return signalsReactModule.useSignalState(var2)
		end,
		setIsOpen = var3
	}
end