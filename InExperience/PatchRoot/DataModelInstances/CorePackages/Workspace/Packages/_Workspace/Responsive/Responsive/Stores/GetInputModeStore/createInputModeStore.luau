local parent = script.Parent.Parent.Parent
local signalsModule = require(parent.Parent.Signals)
local inputModeModule = require(parent.InputMode)

return function()
	-- upvalues: signalsModule (ref), inputModeModule (ref)
	local var1, var2 = signalsModule.createSignal(inputModeModule.last())
	local var3, var4 = signalsModule.createSignal(inputModeModule.preferred())
	inputModeModule.connect(function()
		-- upvalues: var2 (ref), inputModeModule (copy), var4 (ref)
		var2(inputModeModule.last())
		var4(inputModeModule.preferred())
	end)
	
	return { getLastInputType = var1, getPreferredInputType = var3 }
end