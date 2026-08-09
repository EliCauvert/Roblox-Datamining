local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return signalsModule.createComputed(function() --[[ line: 20 | named "createCreatorAgentResumeStore" ]]
	-- upvalues: signalsModule (ref), signalsReactModule (ref)
	local var2, var3 = signalsModule.createSignal(nil)
	
	return {
		getActiveTarget = var2,
		useActiveTarget = function() --[[ line: 23 ]]
			-- upvalues: signalsReactModule (copy), var2 (ref)
			return signalsReactModule.useSignalState(var2)
		end,
		setActiveTarget = var3
	}
end)