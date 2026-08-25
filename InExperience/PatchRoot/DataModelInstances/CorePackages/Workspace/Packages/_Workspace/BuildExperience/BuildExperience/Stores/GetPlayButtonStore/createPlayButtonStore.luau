local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return function()
	-- upvalues: signalsModule (ref), signalsReactModule (ref)
	local var2, var3 = signalsModule.createSignal(false)
	local var4, var5 = signalsModule.createSignal(nil)
	
	return {
		getIsActive = var2,
		useIsActive = function()
			-- upvalues: signalsReactModule (copy), var2 (ref)
			return signalsReactModule.useSignalState(var2)
		end,
		setIsActive = var3,
		getResumeTarget = var4,
		useResumeTarget = function()
			-- upvalues: signalsReactModule (copy), var4 (ref)
			return signalsReactModule.useSignalState(var4)
		end,
		setResumeTarget = var5
	}
end