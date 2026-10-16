local Parent = script.Parent.Parent.Parent
local SignalsModule = require(Parent.Parent.Signals)
local InputModeModule = require(Parent.InputMode)

return function() --[[ Line: 14 ]]
	-- upvalues: SignalsModule (copy), InputModeModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal((InputModeModule.last()))
	local Signal1, Signal2_1 = SignalsModule.createSignal((InputModeModule.preferred()))
	InputModeModule.connect(function() --[[ Line: 18 ]]
		-- upvalues: Signal2 (copy), InputModeModule (upval), Signal2_1 (copy)
		Signal2((InputModeModule.last()))
		Signal2_1((InputModeModule.preferred()))
	end)
	
	return {
		getLastInputType = Signal,
		getPreferredInputType = Signal1
	}
end