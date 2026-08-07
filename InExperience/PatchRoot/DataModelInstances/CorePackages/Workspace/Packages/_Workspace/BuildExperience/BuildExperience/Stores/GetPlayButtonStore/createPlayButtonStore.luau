local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return function() --[[ line: 22 | named "createPlayButtonStore" ]]
	-- upvalues: signalsModule (ref), signalsReactModule (ref)
	local var2, var3 = signalsModule.createSignal(false)
	local var4, var5 = signalsModule.createSignal(nil)
	
	return {
		getIsActive = var2,
		useIsActive = function() --[[ line: 26 ]]
			-- upvalues: signalsReactModule (copy), var2 (ref)
			return signalsReactModule.useSignalState(var2)
		end,
		setIsActive = var3,
		getResumeTarget = var4,
		useResumeTarget = function() --[[ line: 30 ]]
			-- upvalues: signalsReactModule (copy), var4 (ref)
			return signalsReactModule.useSignalState(var4)
		end,
		setResumeTarget = var5
	}
end