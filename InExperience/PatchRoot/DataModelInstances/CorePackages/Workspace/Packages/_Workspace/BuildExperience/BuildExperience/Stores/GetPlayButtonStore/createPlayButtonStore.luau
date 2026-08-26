local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return function()
	-- upvalues: signalsModule (ref), signalsReactModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(nil)
	
	return {
		getIsActive = var1,
		useIsActive = function()
			-- upvalues: signalsReactModule (copy), var1 (ref)
			return signalsReactModule.useSignalState(var1)
		end,
		setIsActive = var2,
		getResumeTarget = var3,
		useResumeTarget = function()
			-- upvalues: signalsReactModule (copy), var3 (ref)
			return signalsReactModule.useSignalState(var3)
		end,
		setResumeTarget = var4
	}
end