local parent = script.Parent.Parent.Parent
local signalsModule = require(parent.Parent.Signals)
local inputModeModule = require(parent.InputMode)

return function() --[[ line: 14 ]]
	-- upvalues: signalsModule (ref), inputModeModule (ref)
	local var2, var3 = signalsModule.createSignal(inputModeModule.last())
	local var4, var5 = signalsModule.createSignal(inputModeModule.preferred())
	inputModeModule.connect(function() --[[ line: 18 ]]
		-- upvalues: var3 (ref), inputModeModule (copy), var5 (ref)
		var3(inputModeModule.last())
		var5(inputModeModule.preferred())
	end)
	
	return { getLastInputType = var2, getPreferredInputType = var4 }
end