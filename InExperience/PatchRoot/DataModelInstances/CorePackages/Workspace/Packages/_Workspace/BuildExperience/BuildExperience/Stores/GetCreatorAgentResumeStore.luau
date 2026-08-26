local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return signalsModule.createComputed(function()
	-- upvalues: signalsModule (ref), signalsReactModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return {
		getActiveTarget = var1,
		useActiveTarget = function()
			-- upvalues: signalsReactModule (copy), var1 (ref)
			return signalsReactModule.useSignalState(var1)
		end,
		setActiveTarget = var2
	}
end)